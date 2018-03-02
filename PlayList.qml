import QtQuick 2.0

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
    }

    Component
    {
        id:playListDelegate

        Text {
            color:"white"
            font.family: openSansFontRegular.name
            text: name + ": " + number
        }
    }

    ListView {
        width: 180; height: 200
        model:testmodel
        delegate: playListDelegate
    }
}
