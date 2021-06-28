import QtQuick 2.0
import QtQuick.Layouts 1.12
Item {
    GridLayout {
        id: radiogrid
        columns: 3
        Text { text: "Three"; font.bold: true; font.pixelSize: 60 }
        Text { text: "words"; color: "red"; font.pixelSize: 60 }
        Text { text: "in"; font.underline: true; font.pixelSize: 60 }
        Text { text: "a"; font.pixelSize: 60 }
        Text { text: "row"; font.strikeout: true; font.pixelSize: 60 }
    }
}
