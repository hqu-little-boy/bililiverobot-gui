#ifndef SETTINGSMANAGER_H
#define SETTINGSMANAGER_H

#include <QObject>
#include <QSettings>
#include <QQmlEngine>
#include <QtQmlIntegration>

class SettingsManager : public QObject {
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

    // TTS设置
    Q_PROPERTY(bool ttsEnabled READ ttsEnabled WRITE setTtsEnabled NOTIFY ttsEnabledChanged)
    Q_PROPERTY(int ttsVolume READ ttsVolume WRITE setTtsVolume NOTIFY ttsVolumeChanged)
    Q_PROPERTY(int ttsSpeed READ ttsSpeed WRITE setTtsSpeed NOTIFY ttsSpeedChanged)
    Q_PROPERTY(QString ttsVoice READ ttsVoice WRITE setTtsVoice NOTIFY ttsVoiceChanged)

    // 欢迎设置
    Q_PROPERTY(bool welcomeEnabled READ welcomeEnabled WRITE setWelcomeEnabled NOTIFY welcomeEnabledChanged)
    Q_PROPERTY(
        QString normalUserWelcome READ normalUserWelcome WRITE setNormalUserWelcome NOTIFY normalUserWelcomeChanged)
    Q_PROPERTY(
        QString captainUserWelcome READ captainUserWelcome WRITE setCaptainUserWelcome NOTIFY captainUserWelcomeChanged)

    // 直播间设置
    Q_PROPERTY(QString roomId READ roomId WRITE setRoomId NOTIFY roomIdChanged)
    Q_PROPERTY(bool autoConnect READ autoConnect WRITE setAutoConnect NOTIFY autoConnectChanged)

private:
    explicit SettingsManager(QObject *parent = nullptr);

public:
    static SettingsManager* instance();
    static SettingsManager* create(QQmlEngine *qmlEngine, QJSEngine *jsEngine);

    // TTS设置
    Q_INVOKABLE bool ttsEnabled() const { return m_ttsEnabled; }
    Q_INVOKABLE void setTtsEnabled(bool enabled);

    Q_INVOKABLE int ttsVolume() const { return m_ttsVolume; }
    Q_INVOKABLE void setTtsVolume(int volume);

    Q_INVOKABLE int ttsSpeed() const { return m_ttsSpeed; }
    Q_INVOKABLE void setTtsSpeed(int speed);

    Q_INVOKABLE QString ttsVoice() const { return m_ttsVoice; }
    Q_INVOKABLE void setTtsVoice(const QString &voice);

    // 欢迎设置
    Q_INVOKABLE bool welcomeEnabled() const { return m_welcomeEnabled; }
    Q_INVOKABLE void setWelcomeEnabled(bool enabled);

    Q_INVOKABLE QString normalUserWelcome() const { return m_normalUserWelcome; }
    Q_INVOKABLE void setNormalUserWelcome(const QString &welcome);

    Q_INVOKABLE QString captainUserWelcome() const { return m_captainUserWelcome; }
    Q_INVOKABLE void setCaptainUserWelcome(const QString &welcome);

    // 直播间设置
    Q_INVOKABLE QString roomId() const { return m_roomId; }
    Q_INVOKABLE void setRoomId(const QString &roomId);

    Q_INVOKABLE bool autoConnect() const { return m_autoConnect; }
    Q_INVOKABLE void setAutoConnect(bool autoConnect);

public slots:
    void saveSettings();

    void loadSettings();

    void resetToDefaults();

signals:
    void ttsEnabledChanged();

    void ttsVolumeChanged();

    void ttsSpeedChanged();

    void ttsVoiceChanged();

    void welcomeEnabledChanged();

    void normalUserWelcomeChanged();

    void captainUserWelcomeChanged();

    void roomIdChanged();

    void autoConnectChanged();

private:
    static SettingsManager* m_instance;
    
    QSettings *m_settings;

    // TTS设置
    bool m_ttsEnabled;
    int m_ttsVolume;
    int m_ttsSpeed;
    QString m_ttsVoice;

    // 欢迎设置
    bool m_welcomeEnabled;
    QString m_normalUserWelcome;
    QString m_captainUserWelcome;

    // 直播间设置
    QString m_roomId;
    bool m_autoConnect;
};

#endif // SETTINGSMANAGER_H
