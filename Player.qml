import QtQuick 2.0
import Qt.labs.settings 1.0
import io.qt.examples.backend 1.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.12
//TODO: Implement Seek
//Control Button Sync with Event

Rectangle {                    //arranged all componet of frontend main page in this rectangle.
    id:playerMainObj
//    border.width: 10
//    border.color: "grey"
    property bool offlinevisible  : true
    property bool  radiovisible: false
    property bool streamvisible: false
    Image {
        id: playerBg
        source: "qrc:/graphics/resources/bkg.png"
         fillMode: Image.PreserveAspectCrop
        //fillMode: Image.PreserveAspectFit
         anchors.fill: parent
        opacity: 0.8
    }

    Engine {
        id:playEngine

        Component.onCompleted: {
            playEngine.playbackChanged.connect(onBackendPlaybackStatusChanged)
            playEngine.playerBackend.positionChanged.connect(onBackEndPositionChanged)
            playEngine.newMediaStarted.connect(prepareForNewMedia)
        }

        Component.onDestruction: {
            playEngine.playbackChanged.disconnect(onBackendPlaybackStatusChanged)
            playEngine.playerBackend.positionChanged.disconnect(onBackEndPositionChanged)
            playEngine.newMediaStarted.disconnect(prepareForNewMedia)
        }

        function prepareForNewMedia() {
            metaDataFetcher.start()
        }

        function onBackEndPositionChanged() {
            playbackSlider.currentValue=playEngine.playerBackend.position
        }

        function onBackendPlaybackStatusChanged() {
            if(playEngine.getPlaybackStatus()===playEngine.playing) {
                playControlObj.playPauseToggle=true
            }
            else if(playEngine.getPlaybackStatus()===playEngine.paused) {
                playControlObj.playPauseToggle=false
            }
            else if(playEngine.getPlaybackStatus()===playEngine.stopped) { }
            else { console.error("Unknown Playback Status") }
        }
    }

    Timer {
        id:metaDataFetcher
        interval: 1000;
        onTriggered: {
            updateUIForNewPlayBack()
        }
    }

    OptionsBar {                                            //visible while offline mode
        id:optionCtrlObj
        width: 40
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: playListObj.left
        anchors.left: parent.left
        height: 20
        anchors.rightMargin: 20
        Component.onCompleted: {
            optionCtrlObj.clicked.connect(onClickEvent)
        }

        function addSongsFromArray(listOffiles)
        {
            for(var i = 0; i <listOffiles.length; i++) {
                console.log("Adding files"+listOffiles[i])
                playEngine.add(listOffiles[i])
            }
        }

        function onClickEvent(buttonId) {
            if(buttonId===optionCtrlObj.browseFoldersButton) {
                var listOffilesFromFolder=backend.browseAllFilesFromFolder()
                addSongsFromArray(listOffilesFromFolder)
            }
            else if(buttonId===optionCtrlObj.browseFilesButton) {
                var listOffiles=backend.browseFiles()
                addSongsFromArray(listOffiles)
            }
            else {
                //do nothing , Future
            }
        }
    }


   Radiolist{                                             // component visibile for radio  strems
        id:radiolistobj
        anchors.top:parent.top
        anchors.bottom: parent.bottom
        anchors.left: optionCtrlObj.right
        anchors.leftMargin: 60
        anchors.right: parent.right
        anchors.margins: 2
        visible: radiovisible
    }
   Streamerlist{                                             // component visibile for online strems
        id:streamerobj
        anchors.top:parent.top
        anchors.bottom: parent.bottom
        anchors.left: optionCtrlObj.right
        anchors.leftMargin: 60
        anchors.right: parent.right
        anchors.margins: 2
        visible: streamvisible
    }

    PlayList {                                                 //component visible for offline mode
        id:playListObj
        anchors.top:parent.top
        anchors.bottom: controlContainer.top
        anchors.bottomMargin: 18
        anchors.left: optionCtrlObj.right
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.margins: 2
        visible: offlinevisible
        Component.onCompleted: {
            playListObj.clicked.connect(onClickEvent)
        }
        function onClickEvent(index) {
            playEngine.playAtIndex(index)
            //Lets Play now
            playEngine.play()
        }
    }

    Column {
        id:controlContainer
        anchors.bottom: parent.bottom
        anchors.topMargin: 12
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.margins: 4
        spacing: 2
        visible: offlinevisible
        PlayInfo {
            id:playbackInfo;
            width: 500
            height:50
            anchors.horizontalCenter: parent.horizontalCenter
           // anchors.verticalCenter: parent.verticalCenter
        }
        PlayControl {
            id:playControlObj
            width: parent.width
            height: 50
            Component.onCompleted: {
                playControlObj.clicked.connect(onClickEvent)
            }
            function onClickEvent(buttonId) {
                if(buttonId===playControlObj.previousButton) {
                    playEngine.previous()
                }
                else if(buttonId===playControlObj.playPauseButton) {
                    if(playEngine.getPlaybackStatus()===playEngine.playing) {
                        playEngine.pause()
                    }
                    else {
                        playEngine.play()
                    }
                }
                else if(buttonId===playControlObj.nextButton) {
                    playEngine.next()
                }
                else if(buttonId===playControlObj.stopButton) {
                    playEngine.stop()
                }
                else {
                    //do nothing , Future
                }
            }
        }
        PlaySlider {
            id:playbackSlider
            width:400
            anchors.horizontalCenter: parent.horizontalCenter
            height: 30
        }
    }

    BackEnd {
        id: backend
    }

    Component.onCompleted: {
        restore()
        playListObj.listmodel=playEngine.playlist
    }

    Component.onDestruction: {
        saveState()
    }

    function saveState(){
        var listOffiles = new Array();
        listOffiles=playEngine.getPlayListItems()
        backend.previousMediaList=listOffiles;
    }

    function restore() {
        var listOffiles = new Array();
        listOffiles=backend.previousMediaList
        for(var i = 0; i <listOffiles.length; i++) {
            playEngine.add(listOffiles[i])
        }
    }

    function updateUIForNewPlayBack() {
        playListObj.currentIndex=playEngine.playlist.currentIndex;
        playbackSlider.maxValue=playEngine.playerBackend.duration
        playbackSlider.minValue=0
        playbackSlider.currentValue=playEngine.playerBackend.position
//        playbackInfo.setText(playEngine.playerBackend.metaData.title
//                             , playEngine.playerBackend.metaData.subTitle
//                             , playEngine.playerBackend.metaData.albumTitle
//                             , playEngine.playerBackend.metaData.albumArtist)
        //console.log(playEngine.playerBackend.metaData.coverArtUrlLarge)
    }

}

