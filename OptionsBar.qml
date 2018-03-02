import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id:optionsControl
    property int browseFoldersButton: 0
    property int browseFilesButton: 1
    signal clicked(int buttonid)
    Image {
        id: playerCtlBg
        source: "qrc:/graphics/resources/playCtl_Bg.png"
        anchors.fill: parent;
    }
    Row
    {
        id:ctrlRow
        anchors.horizontalCenter: playerCtlBg.horizontalCenter
        anchors.verticalCenter: playerCtlBg.verticalCenter
        spacing: 3;
        ControlButton{
            width:playerCtlBg.width/7
            height: playerCtlBg.height/2;
            text: "\uf07c"
            onClicked: optionsControl.clicked(optionsControl.browseFoldersButton)
        }

        ControlButton{
            width:playerCtlBg.width/7
            height: playerCtlBg.height/2;
            text: "\uf1c7"
            onClicked: optionsControl.clicked(optionsControl.browseFilesButton)
        }

        ControlButton{
            width:playerCtlBg.width/7
            height:playerCtlBg.height/2;
            text: "\uf028"
        }
    }
}

