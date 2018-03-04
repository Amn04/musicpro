import QtQuick 2.0

Item {
    FontLoader { id: openSansFontRegular; source: "qrc:/font/resources/fonts/open-sans/OpenSans-Regular.ttf" }

    id:titleBar
    signal minimizeMe()
    signal closeMe()
    property alias title:title.text
    Image {
        id: playerCtlBg
        source: "qrc:/graphics/resources/title_bg.PNG"
        anchors.fill: parent;
    }

    Row
    {
        anchors.fill: parent
        anchors.topMargin: 1
        anchors.bottomMargin: 1
        spacing: 2

        Text {
            id:title
            width: parent.width/1.2
            height:parent.height
            text: "GOGO Music Player"
            font.family:openSansFontRegular.name
            font.bold: true
            font.capitalization: Font.AllUppercase
            color:"#DAA520"
            elide: Text.ElideMiddle
            font.pointSize: 10
        }

        ControlButton
        {
            id:minimizeButton
            width: 20
            height:parent.height
            text: "\uf2d1"
            fontsize: 9
            fontcolor: "white"
            hovercolor: "#FFBF00"
            onClicked: titleBar.minimizeMe()
        }

        ControlButton
        {
            id:closeButton
            width: 20
            height:parent.height
            text: "\uf410"
            fontsize: 9
            fontcolor: "white"
            hovercolor: "#E32636"
            onClicked: titleBar.closeMe()
        }

    }
}
