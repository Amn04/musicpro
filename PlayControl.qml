import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
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
            width:playerCtlBg.width/5
            height: playerCtlBg.height/2;
            text: "\uf28b"
        }

        ControlButton{
            width:playerCtlBg.width/5
            height: playerCtlBg.height/2;
            text: "\uf144"
        }

        ControlButton{
            width:playerCtlBg.width/5
            height:playerCtlBg.height/2;
            text: "\uf101"
        }

        ControlButton{
            width:playerCtlBg.width/5
            height: playerCtlBg.height/2;
            text: "\uf100"
        }
    }
}


