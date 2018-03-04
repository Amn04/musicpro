import QtQuick 2.0
import Qt.labs.settings 1.0
import io.qt.examples.backend 1.0

//TODO: Implement Seek
//Control Button Sync with Event

Rectangle {
    id:playerMainObj
    border.width: 10
    border.color: "grey"
    Image {
        id: playerBg
        source: "qrc:/graphics/resources/background.png"
        anchors.fill: parent
        anchors.margins: 4
    }

    Engine {
        id:playEngine

        Component.onCompleted: {
            playEngine.playerBackend.playbackStateChanged.connect(onBackendPlaybackStatusChanged)
            playEngine.playerBackend.positionChanged.connect(onBackEndPositionChanged)
            playEngine.newMediaStarted.connect(prepareForNewMedia)
        }

        function prepareForNewMedia() {
            metaDataFetcher.start()
        }

        function onBackEndPositionChanged() {
            playbackSlider.currentValue=playEngine.playerBackend.position
        }

        function onBackendPlaybackStatusChanged() {
            if(playEngine.getPlaybackStatus()===playEngine.playing) { }
            else if(playEngine.getPlaybackStatus()===playEngine.paused) { }
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
    PlayInfo {
        id:playbackInfo;
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 2;
        height: parent.height/6
    }
    PlayList {
        id:playListObj
        anchors.top: playbackInfo.bottom
        anchors.bottom: controlContainer.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 2
        Component.onCompleted: {
            playListObj.clicked.connect(onClickEvent)
        }
        function onClickEvent(index) {
            playEngine.playAtIndex(index)
        }
    }

    Column {
        id:controlContainer
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.margins: 4
        spacing: 2
        PlaySlider {
            id:playbackSlider
            width: parent.width
            height: 20
        }

        PlayControl {
            id:playControlObj
            width: parent.width
            height: 70
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
                else {
                    //do nothing , Future
                }
            }
        }

        OptionsBar {
            id:optionCtrlObj
            width: parent.width
            height: 50
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
        playbackInfo.setText(playEngine.playerBackend.metaData.title
                             , playEngine.playerBackend.metaData.subTitle
                             , playEngine.playerBackend.metaData.albumTitle
                             , playEngine.playerBackend.metaData.albumArtist)
        console.log(playEngine.playerBackend.metaData.coverArtUrlLarge)
    }

}

