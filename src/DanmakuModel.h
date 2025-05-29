#ifndef DANMAKUMODEL_H
#define DANMAKUMODEL_H

#include <QAbstractListModel>
#include <QQmlEngine>
#include <QTimer>

struct DanmakuMessage {
    QString user;
    QString text;
    QString time;
    QString type; // normal, captain, visitor
    int id;
};

class DanmakuModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        UserRole = Qt::UserRole + 1,
        TextRole,
        TimeRole,
        TypeRole,
        IdRole
    };

    explicit DanmakuModel(QObject *parent = nullptr);

    // QAbstractListModel interface
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

public slots:
    void addMessage(const QString &user, const QString &text, const QString &type = "normal");
    void clearMessages();
    void pauseTTS();
    void resumeTTS();
    void startSimulation(); // 模拟弹幕数据

signals:
    void messageAdded(const QString &user, const QString &text, const QString &type);
    void messagesCleared();

private slots:
    void generateSimulatedMessage();

private:
    QList<DanmakuMessage> m_messages;
    QTimer *m_simulationTimer;
    int m_nextId;
    
    // 模拟数据
    QStringList m_simulatedUsers;
    QStringList m_simulatedTexts;
    QStringList m_simulatedTypes;
};

#endif // DANMAKUMODEL_H
