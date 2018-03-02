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
                id:titleAnimation
                from: songTitleText.width
                to: -1*songTitleText.width
                loops: Animation.Infinite
                duration: 8000
                Component.onCompleted:
                {
                    //just disabling by default
                    titleAnimation.stop()
                    songTitleText.x=0
                }
            }
            onTextChanged:
            {
                //Check if the title is so long
                titleAnimation.stop()
                if(songTitleText.text.length>20)
                    titleAnimation.start()
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
