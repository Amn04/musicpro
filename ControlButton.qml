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
    signal clicked()
    Button
    {
        id:ctrlButton;
        anchors.fill: parent;
        background: Rectangle
        {
            implicitWidth: 100
            implicitHeight: 25
            border.width: ctrlButton.activeFocus ? 2 : 1
            border.color: "#888"
            radius: 4
            color: ctrlButton.pressed ? "#cccffff" : "transparent"
            /*gradient: Gradient {
                GradientStop { position: 0 ; color: ctrlButton.pressed ? "#cccffff" : "#ffffffff" }
                GradientStop { position: 1 ; color: ctrlButton.pressed ? "#aaaffff" : "#ffffffff" }
            }*/
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



