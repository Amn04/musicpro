import QtQuick 2.0

Item {
    FontLoader { id: openSansFontRegular; source: "qrc:/font/resources/fonts/open-sans/OpenSans-Regular.ttf" }
    property alias title:songTitleText.text
    Column
    {
        Text {
            id:songTitleText
            text: "Hotel California"
            font.family:openSansFontRegular.name
            font.capitalization: Font.AllUppercase
            color:"white"
            font.pointSize: 14
            NumberAnimation on x{
                from: songTitleText.width
                to: -1*songTitleText.width
                loops: Animation.Infinite
                duration: 8000
            }
        }
        Text {
            text: "Eagles"
            font.family:openSansFontRegular.name
            color:"white"
            font.pointSize: 8
        }
        Text {
            text: "Don Felder, Don Henley, Glenn Frey"
            font.family:openSansFontRegular.name
            color:"white"
            font.pointSize: 6
        }
    }


}
