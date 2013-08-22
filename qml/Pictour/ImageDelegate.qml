import QtQuick 2.0


Component{
    id: image_delegate

    Rectangle {
        width: 50; height: 50
        color: "transparent"
        border.color: "black"
        Image {
            id: fileName
            width: 50; height: 50
            source: pic_manager.getThumbnailFor(filePath)
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log(index)
                console.log(pic_manager.getThumbnailFor(filePath))
            }
        }
    }
}
