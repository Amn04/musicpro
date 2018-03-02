import QtQuick 2.0

Item{

    Image {
        id: playerBg
        source: "qrc:/graphics/resources/background.png"
        anchors.fill: parent;
    }

    Column
    {
        width: parent.width
        height: parent.height
        spacing: 2
        PlayInfo
        {
            width: parent.width
            height: parent.height/4
        }
        PlayList
        {
            width: parent.width
            height: parent.height/3
        }
        PlayControl
        {
            width: parent.width
            height: parent.height/4
        }
        OptionsBar
        {
            width: parent.width
            height: parent.height/5
        }
    }


}

