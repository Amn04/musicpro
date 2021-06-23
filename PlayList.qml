import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id:playListControl
   // FontLoader { id: openSansFontRegular; source: "qrc:/font/resources/fonts/open-sans/OpenSans-Regular.ttf" }
    property alias listmodel:playlistview.model
    property alias currentIndex:playlistview.currentIndex
    signal clicked(int index)
   // property var currentname: songnmameinlist.text
//    Image {
//        id: playerCtlBg
//        source: "qrc:/graphics/resources/title_bg.PNG"
//        anchors.fill: parent;
//    }
    Component
    {
        id:playListDelegate
        Rectangle {
            id: content
            anchors { left: parent.left; right: parent.right;margins: 2 }
            height: column.implicitHeight + 4
            color:  listMA.containsMouse? "orange" : "transparent"
            border.width: 1
            anchors.leftMargin: 40
            //border.color: "grey"
            radius: 20
            Column {
                id: column
                anchors { fill: parent; margins: 2 }

                Text {
                    id:songnmameinlist
                    //font.family: openSansFontRegular.name
                    height: 50
                    font.pointSize: 12
                    color:(playlistview.currentIndex==index)?"#3cba54":"white"
                    text: basename(source.toString())
                    //Function to get the basename from URL
                    function basename(str)
                    {
                        var toreturn
                        toreturn=(str.slice(str.lastIndexOf("/")+1))
                        toreturn=toreturn.slice(0,-4)      //to remove extension
                        //console.log(toreturn)
                        return toreturn
                    }

                }

            }
            MouseArea
            {
                id:listMA
                anchors.fill: parent
                hoverEnabled: true
                onClicked:
                {
                    //console.log("clicked: at index: " + index)
                    playlistview.currentIndex = index
                    playListControl.clicked(index)
                }
            }
        }
    }

    ListView {
        id:playlistview
        width: parent.width; height: parent.height
        model:0
        delegate: playListDelegate
        states: [

            State {
                name: "hovered"
                when:listMA.containsMouse
               // when: mouseHandle.containsMouse && songslist.currentIndex!=index
                PropertyChanges {
                    target: playListDelegate
                }
            }
        ]
        ScrollBar.vertical: ScrollBar {}
//        onCurrentIndexChanged:
//        {
//            //console.log("Curent Index changed : "+playlistview.currentIndex)
//        }
    }
}
