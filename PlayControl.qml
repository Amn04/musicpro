import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id:playerCtrl
    property int previousButton: 0
    property int playPauseButton: 1
    property int nextButton: 2
    property int stopButton: 3
    signal clicked(int buttonid)
    property bool playPauseToggle:false
    Image {
        id: playerCtlBg
        source: "qrc:/graphics/resources/white.png"
        anchors.fill: parent;
        opacity: 0
    }

    Row
    {
        id:ctrlRow
        anchors.horizontalCenter: playerCtlBg.horizontalCenter
        anchors.verticalCenter: playerCtlBg.verticalCenter
        spacing: 20
        Button{
            id:previousBt
            width:50
            height: playerCtlBg.height;
            background: Rectangle{
                anchors.fill: parent
                Image {
                    source: "qrc:/graphics/resources/rewind-button.png"
                    anchors.fill: parent
                }
                //color:"white"
                border.color: "grey"
                border.width: 0.98
                radius: 50
                color:previousBt.hovered ? "orange" : "transparent"
            }
           // text: "\uf100"
            onClicked: playEngine.previous()//playerCtrl.clicked(playerCtrl.previousButton)
        }

        Button{
            id:playpauseCtrl
            width:50
            background: Rectangle{
                //color:"white"
                Image{
                    source : !playPauseToggle?"qrc:/graphics/resources/play-button.png":"qrc:/graphics/resources/pause.png"
                anchors.fill: parent
                }
                border.color: "grey"
                border.width: 0.98
                radius: 50
                color: playpauseCtrl.hovered ? "orange" : "transparent"
            }
            height: playerCtlBg.height;

            onClicked: {
                playerCtrl.clicked(playerCtrl.playPauseButton)
            }
        }

//        ControlButton{
//            width:50
//            height: playerCtlBg.height;
//            text: "\uf04d"
//            fontcolor: "#db3236"
//            fontsize: 24 //stop
//            onClicked: playerCtrl.clicked(playerCtrl.stopButton)
//        }

        Button{
            id:nextbt
            width:50
            height: playerCtlBg.height;

            background: Rectangle{
               // color:"white"
                anchors.fill: parent
                Image {
                    source: "qrc:/graphics/resources/right-arrow.png"
                anchors.fill: parent
                }
                border.color: "grey"
                border.width: 0.98
                radius: 50
                color: nextbt.hovered ? "orange" : "transparent"
            }
            //text: "\uf101"
            onClicked: playEngine.next()//playerCtrl.clicked(playerCtrl.nextButton)
        }
        Button{
            id:shufflebt
            width:50
            height: playerCtlBg.height;

            background: Rectangle{
               // color:"white"
                anchors.fill: parent
                Image {
                    source: "qrc:/graphics/resources/shuffle.png"
                anchors.fill: parent
                }
                border.color: "grey"
                border.width: 0.98
                radius: 50
                color: nextbt.hovered ? "orange" : "transparent"
            }
            //text: "\uf101"
            onClicked: playEngine.shuffle()//playerCtrl.clicked(playerCtrl.nextButton)
        }

    }
}
