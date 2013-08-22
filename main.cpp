#include <QtGui/QGuiApplication>
#include <QtQml/QQmlEngine>
#include <QQmlContext>
#include "qtquick2applicationviewer.h"
#include "pictourpicmanager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    PictourPicManager * PicManager = new PictourPicManager();
    viewer.engine()->rootContext()->setContextProperty("pic_manager", PicManager);
    viewer.setMainQmlFile(QStringLiteral("qml/Pictour/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
