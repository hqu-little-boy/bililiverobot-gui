#ifndef TTSMANAGER_H
#define TTSMANAGER_H

#include <QObject>
#include <QQueue>
#include <QTimer>
#include <QQmlEngine>

struct TTSMessage {
    QString text;
    QString voice;
    int volume;
    int speed;
};

class TTSManager : public QObject
{
    Q_OBJECT
    
    Q_PROPERTY(bool isEnabled READ isEnabled WRITE setIsEnabled NOTIFY isEnabledChanged)
    Q_PROPERTY(bool isPlaying READ isPlaying NOTIFY isPlayingChanged)
    Q_PROPERTY(int volume READ volume WRITE setVolume NOTIFY volumeChanged)
    Q_PROPERTY(int speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(QString voice READ voice WRITE setVoice NOTIFY voiceChanged)
    Q_PROPERTY(QStringList availableVoices READ availableVoices CONSTANT)

public:
    explicit TTSManager(QObject *parent = nullptr);

    bool isEnabled() const { return m_isEnabled; }
    void setIsEnabled(bool enabled);
    
    bool isPlaying() const { return m_isPlaying; }
    
    int volume() const { return m_volume; }
    void setVolume(int volume);
    
    int speed() const { return m_speed; }
    void setSpeed(int speed);
    
    QString voice() const { return m_voice; }
    void setVoice(const QString &voice);
    
    QStringList availableVoices() const { return m_availableVoices; }

public slots:
    void speak(const QString &text);
    void speakWithSettings(const QString &text, const QString &voice, int volume, int speed);
    void pause();
    void resume();
    void stop();
    void clearQueue();
    
    // 测试功能
    void testSpeak();

signals:
    void isEnabledChanged();
    void isPlayingChanged();
    void volumeChanged();
    void speedChanged();
    void voiceChanged();
    void speechStarted();
    void speechFinished();
    void speechError(const QString &error);

private slots:
    void processQueue();
    void onSpeechFinished();

private:
    bool m_isEnabled;
    bool m_isPlaying;
    bool m_isPaused;
    int m_volume;
    int m_speed;
    QString m_voice;
    QStringList m_availableVoices;
    
    QQueue<TTSMessage> m_messageQueue;
    QTimer *m_processTimer;
    
    void initializeVoices();
    void startSpeaking(const TTSMessage &message);
};

#endif // TTSMANAGER_H
