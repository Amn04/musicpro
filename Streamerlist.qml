import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
import QtWebView 1.1
Item {

    property string  ur: "https://gaana.com/"
    WebView {
        id:web
        visible: false
           anchors.fill: parent
           url: ur

       }

    ScrollView{
        id:scroll
        anchors.fill: parent

        GridLayout {
           id: grid
           visible: true
           columns: 3
           width: rootWindow.width
           height:rootWindow.height
           columnSpacing: 20


              Column{
               Image {
                   height: 300
                   width: 300
                   source: "qrc:/graphics/resources/onlineplay/jio.png"
                   MouseArea{
                       anchors.fill: parent
                       onClicked: {
                           grid.visible=false
                           web.visible=true
                           scroll.visible=false
                          ur="https://www.jiosaavn.com/"
                       }
                   }
               }
               Text {
                   text: qsTr("Jio Saavn")
               }
           }

              Column{
               Image {
                   height: 300
                   width: 300
                   source: "qrc:/graphics/resources/onlineplay/spotify.png"
                   MouseArea{
                       anchors.fill: parent
                       onClicked: {
                           grid.visible=false
                           web.visible=true
                           scroll.visible=false
                          ur="https://www.spotify.com/"
                       }
                   }
               }
               Text {
                   text: qsTr("Spotify")
               }
           }

              Column{
               Image {
                   height: 300
                   width: 300
                   source: "qrc:/graphics/resources/onlineplay/wybk.png"
                   MouseArea{
                       anchors.fill: parent
                       onClicked: {
                           grid.visible=false
                           web.visible=true
                           scroll.visible=false
                          ur="https://wynk.in/"
                       }
                   }
               }
               Text {
                   text: qsTr("Wynk Music")
               }
           }

//              Column{             //some problem song not playing
//               Image {
//                   height: 300
//                   width: 300
//                   source: "qrc:/graphics/resources/onlineplay/gaana.png"
//                   MouseArea{
//                       anchors.fill: parent
//                       onClicked: {
//                           grid.visible=false
//                           web.visible=true
//                           scroll.visible=false
//                          ur="https://wynk.in/"
//                       }
//                   }
//               }
//               Text {
//                   text: qsTr("Gaana")
//               }
//           }

        }
    }
}
