import QtQuick 2.0

Item {
    Image {
        id: playerCtlBg
        source: "qrc:/graphics/resources/title_bg.PNG"
        anchors.fill: parent;
    }

    FontLoader { id: openSansFontRegular; source: "qrc:/font/resources/fonts/open-sans/OpenSans-Regular.ttf" }

    function setText(title,subTitle,album,artist) {
        songTitleText.text=title?title:"No Titile"
        songSubTitleText.text=subTitle?subTitle:"-"
        songArtistText.text=artist?artist:"Unknown Artist"
        songAlbumText.text=album?album:"Unknown Album"
        titleAnimation.start()
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
            NumberAnimation on x{
                id:titleAnimation
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
        }

        Text {
            id:songSubTitleText
            text: "Unknown"
            font.family:openSansFontRegular.name
            font.capitalization: Font.AllUppercase
            color:"white"
            elide: Text.ElideMiddle
            font.pointSize: 10
        }

        Text {
            id:songAlbumText
            text: "Unknown Album"
            font.family:openSansFontRegular.name
            font.capitalization: Font.AllUppercase
            color:"white"
            elide: Text.ElideMiddle
            font.pointSize: 10
        }

        Text {
            id:songArtistText
            text: "Unknown Artist"
            font.family:openSansFontRegular.name
            font.capitalization: Font.AllUppercase
            color:"white"
            elide: Text.ElideMiddle
            font.pointSize: 10
        }
    }
}
