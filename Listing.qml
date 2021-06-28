import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
id:listing
property bool radiovisible: true
property bool streamervisible: false
Rectangle{
    id:mainrect
Radiolist{
    id:radiolistobj
    visible: radiovisible
    anchors.fill: parent
}
Streamerlist{
    id:streamerobj
    visible: streamervisible
        anchors.fill: parent
}
}
}
