import QtQuick 2.0
import QtQuick.Controls 2.0
//Dangerous to bring in old stuff
//import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtGraphicalEffects 1.0

//Need to be replaced by a custom slider soon

Item {
    id:sliderObj
    property alias currentValue: innerSlider.value
    property alias maxValue: innerSlider.to
    property alias minValue: innerSlider.from
    signal valueChanged()
    Rectangle
    {
        color:"transparent"
        anchors.fill: parent;
    }
    function msToTime(duration) {              //function to convert int to time
        var seconds= parseInt((duration/1000)%60);
        var minutes= parseInt((duration/(1000*60))%60);
        minutes= minutes<10 ? "0"+minutes : minutes;
        seconds= seconds<10 ? "0"+seconds : seconds;
        return minutes+":"+seconds;
    }
       Text {
           id: currentTime                       //text to show current duration
           text: msToTime(playEngine.playerBackend.position)? msToTime(playEngine.playerBackend.position) : "00:00"
           color: "white"
           anchors.right: parent.left
           anchors.rightMargin: 7

   }
    Slider
    {
        anchors.fill: parent
        id:innerSlider
        from: 0
         SliderStyle {
            handle: Rectangle {
                anchors.centerIn: parent
                color: control.pressed ? "black" : "black"
                border.color: "#d4d4dc"
                border.width: 1
                implicitWidth: 14
                implicitHeight: 14
                radius: 12
            }
            groove: Item {
                implicitHeight: 10
                LinearGradient {
                    anchors.fill: parent
                    start: Qt.point(0, control.height / 2)
                    end: Qt.point(control.width, control.height / 2)
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#3cba54" }
                        GradientStop { position: control.value; color: "#3cba54" }
                        GradientStop { position: 1.0; color: "#3cba54" }
                    }
                }
            }
        }

        onValueChanged:
        {
            sliderObj.valueChanged()
        }
        onMoved: {                       //used to gert real time value of slider
            if(pressed) {
                moveSlider()
            }
        }

        function moveSlider() {
            if(typeof moveSlider.i == "undefined") {
                moveSlider.i=0
            }
            if(moveSlider.i%2==0)  {
                if(playEngine.playerBackend.seekable) {
                    playEngine.playerBackend.seek(parseInt(value))

                }
                else {
                    value=playEngine.playerBackend.position
                }
            }

            moveSlider.i++
        }
    }
    Text {
        id: totalTime                  //text to show total duration
        text: msToTime(playEngine.playerBackend.duration)? msToTime(playEngine.playerBackend.duration) : "00:00"
        color: "white"
        anchors.left: parent.right
        anchors.leftMargin: 7
}

}
