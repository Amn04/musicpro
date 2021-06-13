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
        source: "qrc:/graphics/resources/title_bg.PNG"
        anchors.fill: parent;
    }

    Row
    {
        id:ctrlRow
        anchors.horizontalCenter: playerCtlBg.horizontalCenter
        anchors.verticalCenter: playerCtlBg.verticalCenter

        ControlButton{
            width:50
            height: playerCtlBg.height;
            //anchors.verticalCenter: ctrlRow
            text: "\uf100"
            fontcolor: "#f4c20d"
            fontsize: 24
            onClicked: playEngine.previous()//playerCtrl.clicked(playerCtrl.previousButton)
        }

        ControlButton{
            id:playpauseCtrl
            width:50
            fontsize: 24
            height: playerCtlBg.height;
            text: !playPauseToggle?"\uf144":"\uf28b"
            fontcolor: "#3cba54"
            onClicked: {
                playerCtrl.clicked(playerCtrl.playPauseButton)
            }
        }

        ControlButton{
            width:50
            height: playerCtlBg.height;
            text: "\uf04d"
            fontcolor: "#db3236"
            fontsize: 24 //stop
            onClicked: playerCtrl.clicked(playerCtrl.stopButton)
        }

        ControlButton{
            width:50
            height: playerCtlBg.height;
            text: "\uf101"
            fontcolor: "#f4c20d"
            fontsize: 24
            onClicked: playEngine.next()//playerCtrl.clicked(playerCtrl.nextButton)
        }

    }
}


