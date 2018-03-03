import QtQuick 2.0

Item {
    FontLoader { id: openSansFontRegular; source: "qrc:/font/resources/fonts/open-sans/OpenSans-Regular.ttf" }

    function setText(title,subTitle,album,artist) {
        songTitleText.text=title?title:"No Titile"+" | "+subTitle?subTitle:"-"+" | "
                                                                   +artist?artist:"Unknown Artist"+" | "+album?album:"Unknown Album" +" | "
       if(songTitleText.text.length>20)
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

    Text {
        id:songTitleText
        text: "Hotel California | Eagle | "
        font.family:openSansFontRegular.name
        font.capitalization: Font.AllUppercase
        color:"white"
        font.pointSize: 14
    }
}
