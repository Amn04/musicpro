#include <QApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QDebug>
#include <QIcon>
#include "backend.h"

int main(int argc, char *argv[])
{
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication  app(argc, argv);
    app.setOrganizationName("MusicPro");
    app.setOrganizationDomain("aman");
    app.setApplicationName("Music Player");
    app.setWindowIcon(QIcon("qrc:/graphics/resources/gogo.png"));


     qmlRegisterType<BackEnd>("io.qt.examples.backend", 1, 0, "BackEnd");
    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
