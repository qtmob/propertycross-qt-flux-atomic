#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication::setOrganizationName("QtMob");
    QGuiApplication::setOrganizationDomain("http://www.qtmob.org");

    QGuiApplication::setApplicationName("PropertyCross-Flux-Atomic");
    QGuiApplication::setApplicationVersion("1.0.0");

    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
