import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
import QtWebView 1.1
Item{
    WebView {
        id:web
           anchors.fill: parent
           url: "http://radio.garden/"
       }
}
