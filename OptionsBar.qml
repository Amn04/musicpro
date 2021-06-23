import QtQuick 2.0
import QtQuick.Controls 2.0

Item {

    id:optionsControl
    property int browseFoldersButton: 0
    property int browseFilesButton: 1
    signal clicked(int buttonid)
    Image {
        id: playerCtlBg
        source: "qrc:/graphics/resources/white.png"
        anchors.fill: parent;
        opacity: 0
    }
    Column
    {
        id:ctrlRow
//        anchors.horizontalCenter: playerCtlBg.horizontalCenter
//        anchors.verticalCenter: playerCtlBg.verticalCenter
        spacing: 3;

        Button{
            id:folderbt
            width:70
            height: 70
            anchors.rightMargin: 20
            text: "\uf07c"
           // fontcolor: "#4885ed"
            background: Rectangle{
               // color:"white"
                Image {
                    source: "qrc:/graphics/resources/add-folder.png"
                    anchors.fill: parent
                }
                border.color: "grey"
                border.width: 0.98
                radius: 19
                color: folderbt.hovered ? "orange" : "transparent"
            }
            onClicked: optionsControl.clicked(optionsControl.browseFoldersButton)
        }

       Button{
           id:filebt
            width:70
            height:70
            anchors.rightMargin: 20
            text: "\uf1c7"
            //fontcolor: "#4885ed"
            background: Rectangle{
               // color:"white"
                border.color: "grey"
                Image {
                    source: "qrc:/graphics/resources/video-file.png"
                    anchors.fill: parent
                }
                border.width: 0.98
                radius: 19
                color: filebt.hovered ? "orange" : "transparent"
            }
            onClicked: optionsControl.clicked(optionsControl.browseFilesButton)
        }

//        Button{
//            id:writebt
//            width:playerCtlBg.width/7
//            height:playerCtlBg.height;
//            text: "\uf044"
//            background: Rectangle{
//               // color:"white"
//                border.color: "grey"
//                border.width: 0.98
//                radius: 19
//                color: writebt.hovered ? "orange" : "transparent"
//            }
//            //fontcolor: "#4885ed"
//        }
       Button{
           id:soundbt
            width:70
            height:70
            anchors.rightMargin: 20
            text: "\uf028" //mute f026
            background: Rectangle{
               // color:"white"
                border.color: "grey"
                Image {
                    source: "qrc:/graphics/resources/volume-button.png"
                    anchors.fill: parent
                }
                border.width: 0.98
                radius: 19
                color: soundbt.hovered ? "orange" : "transparent"
            }
            //fontcolor: "#4885ed"
        }

        Button{
            id:settingbt
            width:70
            height:70
            text: "\uf013"
            anchors.rightMargin: 20
            background: Rectangle{
               // color:"white"
                border.color: "grey"
                Image {
                    source: "qrc:/graphics/resources/settings.png"
                    anchors.fill: parent
                }
                border.width: 0.98
                radius: 19
                color: settingbt.hovered ? "orange" : "transparent"
            }
            //fontcolor: "#4885ed"
        }
        Button{
            id:radiobt
            width:70
            height:70
            text: "\uf013"
            anchors.rightMargin: 20
            background: Rectangle{
               // color:"white"
                border.color: "grey"
                Image {
                    source: "qrc:/graphics/resources/radio.png"
                    anchors.fill: parent
                }
                border.width: 0.98
                radius: 19
                color: radiobt.hovered ? "orange" : "transparent"
            }
            MouseArea{
                id:radioma
                anchors.fill: parent
                onClicked: {

                }
            }

            //fontcolor: "#4885ed"
        }
    }
}

