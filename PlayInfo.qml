
import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    Image {
        id: playerCtlBg
        source: "qrc:/graphics/resources/white.png"
        anchors.fill: parent;
        opacity: 0
    }

    //FontLoader { id: openSansFontRegular; source: "qrc:/font/resources/fonts/open-sans/OpenSans-Regular.ttf" }

    Column
    {
        anchors.fill: parent
        Text {
            id:songTitleText
            width:parent.width
            text: namereduce(playEngine.playlist.currentItemSource.toString())
            color:"white"
            font.pointSize: 11
//            NumberAnimation on x{
//                            id:titleAnimation
//                            from: 0
//                            to:300
//                            easing: Easing.Linear
//                            loops: Animation.Infinite
//                            duration: 5000
////                            Component.onCompleted: {
////                                //just disabling by default
////                                titleAnimation.stop()
////                                songTitleText.x=0
////                            }
//                        }
            }
        }
    function namereduce(abc)
    {
        var back
        back=(abc.slice(abc.lastIndexOf("/")+1))
        back=back.slice(0,-4)      //to remove extension
        //console.log(toreturn)
        return back
    }
//        Text {
//            id:songSubTitleText
//            text: "Unknown"
//            font.family:openSansFontRegular.name
//            font.capitalization: Font.AllUppercase
//            color:"white"
//            elide: Text.ElideMiddle
//            font.pointSize: 10
//        }

//        Text {
//            id:songAlbumText
//            text: "Unknown Album"
//            font.family:openSansFontRegular.name
//            font.capitalization: Font.AllUppercase
//            color:"white"
//            elide: Text.ElideMiddle
//            font.pointSize: 12
//        }

//        Text {
//            id:songArtistText
//            text: "Unknown Artist"
//            font.family:openSansFontRegular.name
//            font.capitalization: Font.AllUppercase
//            color:"white"
//            elide: Text.ElideMiddle
//            font.pointSize: 12
//        }
    }

