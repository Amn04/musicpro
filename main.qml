import QtQuick 2.9
import QtQuick.Window 2.0

Window {
    id:rootWindow
    visible: true
    width: 1000
    height: 750
    title: qsTr("Music Pro")

    Player {
        width:rootWindow.width
        height: rootWindow.height
   }
}
