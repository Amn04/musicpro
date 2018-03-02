import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id:rootWindow

//TODO: Enable When Frameless Window comes in
//    property variant clickPos: "1,1"
//    MouseArea
//    {
//        anchors.fill: parent
//        onPressed: {
//            clickPos  = Qt.point(mouse.x,mouse.y)
//        }

//        onPositionChanged: {
//            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
//            rootWindow.x += delta.x;
//            rootWindow.y += delta.y;
//        }
//    }
    visible: true
    width: 320
    height: 480
    title: qsTr("GoGo Music Player V1.0")
    //TODO: Check flags later
    //flags:
    //flags: Qt.Window | Qt.FramelessWindowHint
    minimumHeight: height
    minimumWidth: width
    maximumHeight: minimumHeight
    maximumWidth: minimumWidth

    Player
    {
        anchors.fill: parent;
    }

}
