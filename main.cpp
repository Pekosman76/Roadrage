#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "score.h"
#include <QGuiApplication>
#include <QDir>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QString version = "desktop";

    score scores;

#ifdef MOBILE
    version = "mobile";
#endif

    engine.rootContext()->setContextProperty("version", version);
    engine.rootContext()->setContextProperty("scores", &scores);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
