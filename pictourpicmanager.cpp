#include <QCryptographicHash>
#include <QStandardPaths>
#include <QFileInfo>
#include <QImage>
#include <QDir>
#include "pictourpicmanager.h"

#include <QDebug>

PictourPicManager::PictourPicManager(QObject *parent) :
    QObject(parent)
{
}

QString PictourPicManager::getPictureFolder(){
    QStringList all_found = QStandardPaths::standardLocations(QStandardPaths::PicturesLocation);
    QString pictures_path = QString("");
    if (all_found.length() > 0){
        pictures_path = all_found[0];
    }
    return pictures_path;
}

QString PictourPicManager::getThumbnailFolder(){
    QStringList all_found = QStandardPaths::standardLocations(QStandardPaths::DataLocation);
    QString data_path = QString("");
    if (all_found.length() > 0){
        data_path = all_found[0];
    }
    return data_path;
}

QString PictourPicManager::getThumbnailFor(QString picture_path){
    QDir * original_path = new QDir(picture_path);
    QString thumb_name = QString(QCryptographicHash::hash((original_path->absolutePath().toUtf8()),QCryptographicHash::Md5).toHex());
    thumb_name.append(".jpg");
    QDir thumb_path = QDir(thumb_name, this->getThumbnailFolder());
    if (!QFileInfo(thumb_path.absolutePath()).exists()){
        QImage * img = new QImage();
        img->load(picture_path);
        QImage result = img->scaled(50, 50, Qt::IgnoreAspectRatio, Qt::FastTransformation);
        result.save(thumb_path.absolutePath());
        delete img;
    }
    delete original_path;
    qDebug() << thumb_path.absolutePath();
    return thumb_path.absolutePath();
}
