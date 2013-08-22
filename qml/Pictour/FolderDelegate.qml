import QtQuick 2.0

Component{
    id: folder_delegate
    Rectangle {
        width: 150; height: 30
        color: "transparent"
        Image {
            id: folder_image
            width: 20; height: 16
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/folder-black.png"
        }
        Text  {
            anchors.left:  folder_image.right
            text: fileName
            horizontalAlignment: Text.AlignRight
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (base_folder.isFolder(index)){
                    base_folder.folder = filePath
                    current_folder.folder = filePath
                }
            }
        }
    }
}
