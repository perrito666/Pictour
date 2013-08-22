#ifndef PICTOURPICMANAGER_H
#define PICTOURPICMANAGER_H

#include <QObject>
#include <QDir>

class PictourPicManager : public QObject
{
    Q_OBJECT
public:
    explicit PictourPicManager(QObject *parent = 0);
    QString getThumbnailFolder();

signals:
    
public slots:
    QString getPictureFolder();
    QString getThumbnailFor(QString picture_path);
};

#endif // PICTOURPICMANAGER_H
