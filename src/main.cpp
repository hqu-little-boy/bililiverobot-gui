#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QIcon>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    
    // 设置应用信息
    app.setApplicationName("BilibiliBot");
    app.setApplicationVersion("1.0.0");
    app.setOrganizationName("BilibiliBot Team");
    app.setOrganizationDomain("bilibilibot.com");
    
    // // 设置应用图标
    // app.setWindowIcon(QIcon(":/resources/icons/app_icon.png"));
    
    // 设置QuickControls2样式
    QQuickStyle::setStyle("Material");
    
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
