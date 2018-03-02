import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    FontLoader { id: openSansFontRegular; source: "qrc:/font/resources/fonts/open-sans/OpenSans-Regular.ttf" }

    ListModel {
        id:testmodel
        ListElement {
            name: "Hotel California"
            number: "12:30"
        }
        ListElement {
            name: "Waka Waka"
            number: "1:30"
        }
        ListElement {
            name: "Teri Meri"
            number: "4:30"
        }
        ListElement {
            name: "Hotel California"
            number: "12:30"
        }
        ListElement {
            name: "Waka Waka"
            number: "1:30"
        }
        ListElement {
            name: "Teri Meri"
            number: "4:30"
        }
        ListElement {
            name: "Hotel California"
            number: "12:30"
        }
        ListElement {
            name: "Waka Waka"
            number: "1:30"
        }
        ListElement {
            name: "Teri Meri"
            number: "4:30"
        }
    }

    Component
    {
        id:playListDelegate
        Rectangle {
            id: content
            anchors { left: parent.left; right: parent.right }
            height: column.implicitHeight + 4
            color:"transparent"
            border.width: 1
            border.color: "grey"
            radius: 2
            Column {
                id: column
                anchors { fill: parent; margins: 2 }

                Text {
                    font.family: openSansFontRegular.name
                    color:"white"
                    text: name+': ' + number
                }

            }
        }
    }

    ListView {
        id:playlist
        width: parent.width; height: parent.height
        model:testmodel
        delegate: playListDelegate
        ScrollBar.vertical: ScrollBar {}
    }
}
