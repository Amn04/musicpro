import QtQuick 2.0

Item {
    FontLoader { id: openSansFontRegular; source: "qrc:/font/resources/fonts/open-sans/OpenSans-Regular.ttf" }
    Column
    {
        Text {
            text: "Hotel California"
            font.family:openSansFontRegular.name
            color:"white"
            font.pointSize: 24
        }
        Text {
            text: "Eagles"
            font.family:openSansFontRegular.name
            color:"white"
            font.pointSize: 14
        }
        Text {
            text: "Don Felder, Don Henley, Glenn Frey"
            font.family:openSansFontRegular.name
            color:"white"
            font.pointSize: 12
        }
    }


}
