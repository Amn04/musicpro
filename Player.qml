import QtQuick 2.0
import Qt.labs.settings 1.0
import io.qt.examples.backend 1.0

Item {
    id:playerMainObj

    Image {
        id: playerBg
        source: "qrc:/graphics/resources/background.png"
        anchors.fill: parent;
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

    Column {
        width: parent.width
        height: parent.height//-titleBar.height
        spacing: 2
        PlayInfo {
            id:playbackInfo;
            width: parent.width
            height: parent.height/6
        }
        PlayList {
            id:playListObj
            width: parent.width
            height: parent.height/3
            Component.onCompleted: {
                playListObj.clicked.connect(onClickEvent)
            }
            function onClickEvent(index) {
                playEngine.playAtIndex(index)
            }
        }

        PlaySlider {
            id:playbackSlider
            width: parent.width
            height: parent.height/10
        }

        PlayControl {
            id:playControlObj
            width: parent.width
            height: parent.height/5
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
            height: parent.height/8
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
    }

}

