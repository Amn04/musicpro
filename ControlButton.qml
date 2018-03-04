import QtQuick 2.0
import QtQuick.Controls 2.3

Item
{
    id:ctrlButtonContainer
    //https://fontawesome.com/cheatsheet
    FontLoader { id: fontAwesome; source: "qrc:/font/resources/fonts/F_Awesome-5_Free-Solid-900.otf" }
    property alias text: ctrlButtontext.text
    property int fontsize:30
    property string fontcolor:"#05E9FF"
    property string hovercolor: "#3B444B"
    signal clicked()
    Button
    {
        id:ctrlButton;
        anchors.fill: parent;
        background: Rectangle
        {
            id:buttonBGRect
            implicitWidth: 100
            implicitHeight: 25
            border.width: ctrlButton.activeFocus ? 2 : 1
            border.color: "#888"
            radius: 4
            color: ctrlButton.hovered ? hovercolor : "transparent"
        }

        Text
        {
            id:ctrlButtontext;
            anchors.horizontalCenter: ctrlButton.horizontalCenter
            anchors.verticalCenter: ctrlButton.verticalCenter
            font.pixelSize: fontsize
            font.family: fontAwesome.name
            //color: ctrlButton.down ? "#17a81a" : "#21be2b"
            text: "\uf28b"
            color: ctrlButton.pressed ?"white" : fontcolor
        }
        onClicked: ctrlButtonContainer.clicked()
    }
}



