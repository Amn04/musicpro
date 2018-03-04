import QtQuick 2.9
import QtQuick.Window 2.0

Window {
    id:rootWindow

    property variant clickPos: "1,1"
    MouseArea {
        anchors.fill: parent
        onPressed: {
            clickPos  = Qt.point(mouse.x,mouse.y)
        }

        onPositionChanged: {
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
            rootWindow.x += delta.x;
            rootWindow.y += delta.y;
        }
    }
    visible: true
    width: 320
    height: 480
    title: qsTr("GoGo Music Player V1.0")
    flags: Qt.Window | Qt.FramelessWindowHint
    minimumHeight: height
    minimumWidth: width
    maximumHeight: minimumHeight
    maximumWidth: minimumWidth

    Column {
        anchors.fill: parent
        TitleBar {
            id:titleBar
            width:rootWindow.width
            height:20

            onMinimizeMe: {
                rootWindow.showMinimized()
            }
            onCloseMe: {
                rootWindow.close()
            }
        }

        Player {
            width:rootWindow.width
            height: rootWindow.height-titleBar.height
        }
    }
}
