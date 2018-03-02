import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 320
    height: 480
    title: qsTr("GoGo Music Player V1.0")
    //TODO: Check flags later
    //flags:
    minimumHeight: height
    minimumWidth: width
    maximumHeight: minimumHeight
    maximumWidth: minimumWidth

    Player
    {
        anchors.fill: parent;
    }

}
