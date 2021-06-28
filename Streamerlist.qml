import QtQuick 2.0
import QtQuick.Layouts 1.12
Item {
    GridLayout {
        id: streamgrid
        columns: 3
        Text { text: "Three"; font.bold: true; }
        Text { text: "words"; color: "red" }
        Text { text: "in"; font.underline: true }
        Text { text: "a"; font.pixelSize: 20 }
        Text { text: "row"; font.strikeout: true }
    }
}
