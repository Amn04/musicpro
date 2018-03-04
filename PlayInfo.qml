import QtQuick 2.0

Item {
    Rectangle {
        id: playerCtlBg
        color:"black"
        anchors.fill: parent;
    }

    FontLoader { id: openSansFontRegular; source: "qrc:/font/resources/fonts/open-sans/OpenSans-Regular.ttf" }

    function setText(title,subTitle,album,artist) {
        songTitleText.text=title?title:"No Titile"+" | "+subTitle?subTitle:"-"+" | "
                                                                   +artist?artist:"Unknown Artist"+" | "+album?album:"Unknown Album" +" | "
        titleAnimation.start()
    }

    NumberAnimation on x{
        id:titleAnimation
        target:songTitleText
        from: songTitleText.width
        to: -1*songTitleText.width
        loops: Animation.Infinite
        duration: 8000
        Component.onCompleted: {
            //just disabling by default
            titleAnimation.stop()
            songTitleText.x=0
        }
    }

    Column
    {
        anchors.fill: parent
        Text {
            id:songTitleText
            width:parent.width
            text: "Hotel California | Eagle | "
            font.family:openSansFontRegular.name
            font.capitalization: Font.AllUppercase
            color:"white"
            font.pointSize: 14
        }

        Text {
            id:songSubTitleText
            text: "Unknown"
            font.family:openSansFontRegular.name
            font.capitalization: Font.AllUppercase
            color:"white"
            font.pointSize: 10
        }

        Text {
            id:songAlbumText
            text: "Unknown Album"
            font.family:openSansFontRegular.name
            font.capitalization: Font.AllUppercase
            color:"white"
            font.pointSize: 10
        }

        Text {
            id:songArtistText
            text: "Unknown Artist"
            font.family:openSansFontRegular.name
            font.capitalization: Font.AllUppercase
            color:"white"
            font.pointSize: 10
        }
    }
}
