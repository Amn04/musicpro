#include <QApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QDebug>
#include <QIcon>
#include <QtWebView>
#include "backend.h"

int main(int argc, char *argv[])
{
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QtWebView::initialize();
    QApplication  app(argc, argv);
    app.setOrganizationName("MusicPro");
    app.setOrganizationDomain("aman");
    app.setApplicationName("Music Player");

    qmlRegisterType<BackEnd>("io.qt.examples.backend", 1, 0, "BackEnd");
    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
