import QtQuick 2.0
import QtQuick.Controls 2.3
//Dangerous to bring in old stuff
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

//Need to be replaced by a custom slider soon

Item {
    id:sliderObj
    property alias currentValue: innerSlider.value
    property alias maxValue: innerSlider.maximumValue
    property alias minValue: innerSlider.minimumValue
    signal valueChanged()
    Rectangle
    {
        color:"black"
        anchors.fill: parent;
    }

    Slider
    {
        anchors.fill: parent
        id:innerSlider
        minimumValue: 0
        style: SliderStyle {
            handle: Rectangle {
                anchors.centerIn: parent
                color: control.pressed ? "#8C0095" : "#05E9FF"
                border.color: "black"
                border.width: 1
                implicitWidth: 14
                implicitHeight: 14
                radius: 1
            }
            groove: Item {
                implicitHeight: 10
                LinearGradient {
                    anchors.fill: parent
                    start: Qt.point(0, control.height / 2)
                    end: Qt.point(control.width, control.height / 2)
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#d4d4dc" }
                        GradientStop { position: control.value; color: "#1d1e22" }
                        GradientStop { position: 1.0; color: "#393f4d" }
                    }
                }
            }
        }

        onValueChanged:
        {
            sliderObj.valueChanged()
        }
    }
}
