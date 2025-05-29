#ifndef BILIBILIAPI_H
#define BILIBILIAPI_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QTimer>
#include <QQmlEngine>

class BilibiliApi : public QObject
{
    Q_OBJECT
    
    Q_PROPERTY(bool isLoggedIn READ isLoggedIn NOTIFY loginStatusChanged)
    Q_PROPERTY(bool isConnected READ isConnected NOTIFY connectionStatusChanged)
    Q_PROPERTY(QString qrCodeUrl READ qrCodeUrl NOTIFY qrCodeUrlChanged)
    Q_PROPERTY(QString loginStatus READ loginStatus NOTIFY loginStatusChanged)
    Q_PROPERTY(QString currentRoomId READ currentRoomId WRITE setCurrentRoomId NOTIFY currentRoomIdChanged)

public:
    explicit BilibiliApi(QObject *parent = nullptr);

    bool isLoggedIn() const { return m_isLoggedIn; }
    bool isConnected() const { return m_isConnected; }
    QString qrCodeUrl() const { return m_qrCodeUrl; }
    QString loginStatus() const { return m_loginStatus; }
    QString currentRoomId() const { return m_currentRoomId; }
    void setCurrentRoomId(const QString &roomId);

public slots:
    // 登录相关
    void generateQRCode();
    void checkLoginStatus();
    void logout();
    void simulateLogin(); // 模拟登录成功
    
    // 直播间连接
    void connectToRoom(const QString &roomId);
    void disconnectFromRoom();
    
    // 数据获取
    void getRoomInfo();
    void getUserInfo();

signals:
    void loginStatusChanged();
    void connectionStatusChanged();
    void qrCodeUrlChanged();
    void currentRoomIdChanged();
    
    // 登录相关信号
    void loginSuccess();
    void loginFailed(const QString &error);
    void qrCodeGenerated(const QString &url);
    
    // 连接相关信号
    void roomConnected();
    void roomDisconnected();
    void connectionError(const QString &error);
    
    // 数据信号
    void roomInfoReceived(const QVariantMap &info);
    void userInfoReceived(const QVariantMap &info);
    
    // 直播间事件信号
    void danmakuReceived(const QString &user, const QString &message, const QString &type);
    void giftReceived(const QString &user, const QString &gift, int count);
    void followReceived(const QString &user);
    void shareReceived(const QString &user);

private slots:
    void onNetworkReply();
    void checkQRCodeStatus();

private:
    QNetworkAccessManager *m_networkManager;
    QTimer *m_qrCheckTimer;
    
    bool m_isLoggedIn;
    bool m_isConnected;
    QString m_qrCodeUrl;
    QString m_loginStatus;
    QString m_currentRoomId;
    QString m_accessToken;
    QString m_refreshToken;
    
    // 模拟数据生成
    void startEventSimulation();
    QTimer *m_eventSimulationTimer;
};

#endif // BILIBILIAPI_H
