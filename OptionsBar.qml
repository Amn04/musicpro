import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id:optionsControl
    property int browseFoldersButton: 0
    property int browseFilesButton: 1
    signal clicked(int buttonid)
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
        spacing: 3;

        ControlButton{
            width:playerCtlBg.width/7
            height: playerCtlBg.height;
            text: "\uf07c"
            fontcolor: "#4885ed"
            onClicked: optionsControl.clicked(optionsControl.browseFoldersButton)
        }

        ControlButton{
            width:playerCtlBg.width/7
            height: playerCtlBg.height;
            text: "\uf1c7"
            fontcolor: "#AA40FF"
            onClicked: optionsControl.clicked(optionsControl.browseFilesButton)
        }

        ControlButton{
            width:playerCtlBg.width/7
            height:playerCtlBg.height;
            text: "\uf044"
            fontcolor: "#FE7C22"
        }
        ControlButton{
            width:playerCtlBg.width/7
            height:playerCtlBg.height;
            text: "\uf028"
            fontcolor: "#3cba54"
        }

        ControlButton{
            width:playerCtlBg.width/7
            height:playerCtlBg.height;
            text: "\uf013"
            fontcolor: "#f4c20d"
        }
    }
}

