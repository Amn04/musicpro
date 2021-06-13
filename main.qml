import QtQuick 2.9
import QtQuick.Window 2.0

Window {
    id:rootWindow
    visible: true
    width: 600
    height: 480
    title: qsTr("Music Pro")
    minimumHeight: height
    minimumWidth: width
Column{
    Player {
        width:rootWindow.width
        height: rootWindow.height
       }
   }
}
