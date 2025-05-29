#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QIcon>

#include "DanmakuModel.h"
#include "SettingsManager.h"
#include "BilibiliApi.h"
#include "TTSManager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    
    // 设置应用信息
    app.setApplicationName("BilibiliBot");
    app.setApplicationVersion("1.0.0");
    app.setOrganizationName("BilibiliBot Team");
    app.setOrganizationDomain("bilibilibot.com");
    
    // 设置应用图标
    app.setWindowIcon(QIcon(":/resources/icons/app_icon.png"));
    
    // 设置QuickControls2样式
    QQuickStyle::setStyle("Material");
    
    // 注册C++类型到QML
    qmlRegisterType<DanmakuModel>("BilibiliBot", 1, 0, "DanmakuModel");
    qmlRegisterType<SettingsManager>("BilibiliBot", 1, 0, "SettingsManager");
    qmlRegisterType<BilibiliApi>("BilibiliBot", 1, 0, "BilibiliApi");
    qmlRegisterType<TTSManager>("BilibiliBot", 1, 0, "TTSManager");
    
    QQmlApplicationEngine engine;
    
    // 加载QML主界面
    const QUrl url(QStringLiteral("qrc:/qt/qml/BilibiliBot/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    
    engine.load(url);
    
    return app.exec();
}
