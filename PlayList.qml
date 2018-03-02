import QtQuick 2.0

Item {


    ListModel {
        id:testmodel
        ListElement {
            name: "\uf28b"
            number: "555 3264"
        }

    }

    ListView {
        width: 180; height: 200

        model:testmodel
        delegate: Text {
            text: name + ": " + name
        }
    }
}
