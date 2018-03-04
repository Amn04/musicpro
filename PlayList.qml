import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id:playListControl
    FontLoader { id: openSansFontRegular; source: "qrc:/font/resources/fonts/open-sans/OpenSans-Regular.ttf" }
    property alias listmodel:playlistview.model
    property alias currentIndex:playlistview.currentIndex
    signal clicked(int index)
    Image {
        id: playerCtlBg
        source: "qrc:/graphics/resources/title_bg.PNG"
        anchors.fill: parent;
    }
    Component
    {
        id:playListDelegate
        Rectangle {
            id: content
            anchors { left: parent.left; right: parent.right;margins: 2 }
            height: column.implicitHeight + 4
            color:"transparent"
            border.width: 1
            border.color: "grey"
            radius: 2
            Column {
                id: column
                anchors { fill: parent; margins: 2 }

                Text {
                    //font.family: openSansFontRegular.name
                    font.pixelSize: (playlistview.currentIndex==index)?16:12
                    color:(playlistview.currentIndex==index)?"#FF5A09":"white"
                    font.capitalization: (playlistview.currentIndex==index)?Font.AllUppercase:Font.AllLowercase
                    text: basename(source.toString())
                    //Function to get the basename from URL
                    function basename(str)
                    {
                        return (str.slice(str.lastIndexOf("/")+1))
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked:
                        {
                            //console.log("clicked: at index: " + index)
                            playlistview.currentIndex = index
                            playListControl.clicked(index)
                        }
                    }
                }
            }
        }
    }

    ListView {
        id:playlistview
        width: parent.width; height: parent.height
        model:0
        delegate: playListDelegate
        ScrollBar.vertical: ScrollBar {}
//        onCurrentIndexChanged:
//        {
//            //console.log("Curent Index changed : "+playlistview.currentIndex)
//        }
    }
}
