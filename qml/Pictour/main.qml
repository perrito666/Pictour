import QtQuick 2.0
import Ubuntu.Components 0.1
import Qt.labs.folderlistmodel 2.0
import "." as Pictour

MainView {
    id: mainView
    width: units.gu(70)
    height: units.gu(80)

    FolderListModel {
        id: base_folder
        showDotAndDotDot: true
        folder: pic_manager.getPictureFolder()
        nameFilters: [ "" ]
    }

    FolderListModel {
        id: current_folder
        showDotAndDotDot: false
        showDirs: false
        folder: pic_manager.getPictureFolder()
        nameFilters: [ "*.jpg" ]
    }


    Page {
        id: main_page

        Tabs {
            id: tabs
            x: 0
            y: 43
            width: 560
            anchors.top: parent.top
            height: 354
            anchors.bottomMargin: 243
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 43
            Tab {
                width: 180; height: 300
                title: "Filesystem"
                page: Page {
                    width: 180; height: 300

                    ListView {
                        id: file_system_list
                        anchors.fill: parent
                        spacing: 4
                        model: base_folder
                        delegate: FolderDelegate{}
                    }
                }
            }
            Tab {
                title: "Location"
                page: Page {
                    Label {
                        anchors.centerIn: parent
                        text: "Use header to navigate between tabs"
                    }
                }
            }
        }
        Page {
            id: images_container
            x: 0
            anchors.right: tabs.left
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.topMargin: 397
            anchors.bottomMargin: 43
            anchors.rightMargin: -560
            anchors.leftMargin: 0

            ListView {
                orientation: ListView.Horizontal
                height: 100
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                id: pics_list;
                y: 0
                model: current_folder
                delegate: ImageDelegate{}
                spacing: 4;
            }
        }

    }

}
