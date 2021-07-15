import QtQuick 2.15
import QtQuick.Controls 2.0

Item {

    id:optionsControl
    property int browseFoldersButton: 0
    property int browseFilesButton: 1
    signal clicked(int buttonid)

    Column
    {
        id:ctrlRow
//        anchors.horizontalCenter: playerCtlBg.horizontalCenter
//        anchors.verticalCenter: playerCtlBg.verticalCenter
        spacing: 5
        padding: 10

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
//       Button{
//           id:soundbt
//            width:70
//            height:70
//            anchors.rightMargin: 20
//            text: "\uf028" //mute f026
//            background: Rectangle{
//               // color:"white"
//                border.color: "grey"
//                Image {
//                    source: "qrc:/graphics/resources/volume-button.png"
//                    anchors.fill: parent
//                }
//                border.width: 0.98
//                radius: 19
//                color: soundbt.hovered ? "orange" : "transparent"
//            }
//            //fontcolor: "#4885ed"
//        }

//        Button{
//            id:settingbt
//            width:70
//            height:70
//            text: "\uf013"
//            anchors.rightMargin: 20
//            background: Rectangle{
//               // color:"white"
//                border.color: "grey"
//                Image {
//                    source: "qrc:/graphics/resources/settings.png"
//                    anchors.fill: parent
//                }
//                border.width: 0.98
//                radius: 19
//                color: settingbt.hovered ? "orange" : "transparent"
//            }
//            //fontcolor: "#4885ed"
//        }
        Button{
            id:radiobt
            width:70
            height:70
            text: "\uf013"
            visible: if(offlinevisible)
                         true
                         else if(radiovisible)
                         true
                         else
                         false
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
                    if(radiovisible==true)
                       radiolistobj.tostop()
                    else
                        radiolistobj.toreload()
                      radiovisible= radiovisible?false:true
                     offlinevisible=offlinevisible?false:true

                }
            }

            //fontcolor: "#4885ed"
        }
        Button{
            id:streambt
            width:70
            height:70
            text: "\uf013"
            visible: if(offlinevisible)
                         true
                         else if(streamvisible)
                         true
                         else
                         false
            anchors.rightMargin: 20
            background: Rectangle{
               // color:"white"
                border.color: "grey"
                Image {
                    source: "qrc:/graphics/resources/streaming.png"
                    anchors.fill: parent
                }
                border.width: 0.98
                radius: 19
                color: streambt.hovered ? "orange" : "transparent"
            }
            MouseArea{
                id:streamMA
                anchors.fill: parent
                onClicked: {
                    if(streamvisible==true)
                       streamerobj.tostop()
                    else
                        streamerobj.toreload()
                      streamvisible= streamvisible?false:true
                     offlinevisible=offlinevisible?false:true
                }
            }
        }
        Button{
            id:streambackbt
            width:70
            height:70
            text: "\uf013"
            visible: if(offlinevisible)
                         false
                         else if(streamvisible)
                         true

            anchors.rightMargin: 20
            background: Rectangle{
               // color:"white"
                border.color: "grey"
                Image {
                    source: "qrc:/graphics/resources/back.png"
                    anchors.fill: parent
                }
                border.width: 0.98
                radius: 19
                color: streambt.hovered ? "orange" : "transparent"
            }
            MouseArea{
                id:streambackMA
                anchors.fill: parent
                onClicked: {
                    streamerobj.s
                }
            }
        }

    }
}

