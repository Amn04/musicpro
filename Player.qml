import QtQuick 2.0
import Qt.labs.settings 1.0

Item
{
    id:playerMainObj
    Settings
    {
        id:playerSettingsObj
    }

    Timer {
        id:metaDataFetcher
        interval: 1000;

        onTriggered:
        {
            updateUIForNewPlayBack()
        }
    }

    Component.onCompleted:
    {
    }

    Component.onDestruction:
    {
        //TODO :Implement
        //Save and Restore Settings
    }

    Engine
    {
        id:playEngine
        Component.onCompleted:
        {
            playEngine.playerBackend.playbackStateChanged.connect(onBackendPlaybackStatusChanged)
            playEngine.playerBackend.positionChanged.connect(onBackEndPositionChanged)
            playEngine.newMediaStarted.connect(prepareForNewMedia)
        }

        function prepareForNewMedia()
        {
            console.log("New Media: "+ playEngine.playlist.currentIndex)

            //add a delay to fetch the metadata
            metaDataFetcher.start()

        }

        function onBackEndPositionChanged()
        {
         //   playbackSlider.maxValue=playEngine.playerBackend.duration
            playbackSlider.currentValue=playEngine.playerBackend.position
        }

        function onBackendPlaybackStatusChanged()
        {
            if(playEngine.getPlaybackStatus()===playEngine.playing) { }
            else if(playEngine.getPlaybackStatus()===playEngine.paused) { }
            else if(playEngine.getPlaybackStatus()===playEngine.stopped) { }
            else { console.error("Unknown Playback Status") }
        }
    }

    function updateUIForNewPlayBack()
    {
        playListObj.currentIndex=playEngine.playlist.currentIndex;
        playbackSlider.maxValue=playEngine.playerBackend.duration
        playbackSlider.minValue=0
        playbackSlider.currentValue=playEngine.playerBackend.position
        playbackInfo.title=playEngine.playerBackend.metaData.title
    }

    BrowsePopup
    {
        id:browsePopUp
        visible: false;
        Component.onCompleted: {
            browsePopUp.listofSelectedFiles.connect(addFilesToPlayer)
        }
        function addFilesToPlayer(fileList)
        {
            // console.log("Adding Multiple files")
            playEngine.addMultiple(fileList)
            playListObj.listmodel=playEngine.playlist
        }
    }

    Image {
        id: playerBg
        source: "qrc:/graphics/resources/background.png"
        anchors.fill: parent;
    }
    /* TitleBar{
        id:titleBar
        width: parent.width
        height: 20
    }*/

    Column
    {
        width: parent.width
        height: parent.height//-titleBar.height
        spacing: 2
        PlayInfo
        {
            id:playbackInfo;
            width: parent.width
            height: parent.height/4
        }
        PlayList
        {
            id:playListObj
            width: parent.width
            height: parent.height/3
            Component.onCompleted:
            {
                playListObj.clicked.connect(onClickEvent)
            }
            function onClickEvent(index)
            {
                playEngine.playAtIndex(index)
            }
        }
        PlayControl
        {
            id:playControlObj
            width: parent.width
            height: parent.height/5
            Component.onCompleted:
            {
                playControlObj.clicked.connect(onClickEvent)
            }
            function onClickEvent(buttonId)
            {
                if(buttonId===playControlObj.previousButton)
                {
                    playEngine.previous()
                }
                else if(buttonId===playControlObj.playPauseButton)
                {
                    // console.log("Click on Play Pause")

                    if(playEngine.getPlaybackStatus()===playEngine.playing)
                    {
                        // console.log("Playing, now pausing")
                        playEngine.pause()
                    }
                    else
                    {
                        playEngine.play()
                    }
                }
                else if(buttonId===playControlObj.nextButton)
                {
                    playEngine.next()
                }
                else
                {
                    //do nothing , Future
                }
            }
        }
        PlaySlider
        {
            id:playbackSlider
            width: parent.width
            height: parent.height/10
        }

        OptionsBar
        {
            id:optionCtrlObj
            width: parent.width
            height: parent.height/8
            Component.onCompleted: {
                optionCtrlObj.clicked.connect(onClickEvent)
            }
            function onClickEvent(buttonId)
            {
                if(buttonId===optionCtrlObj.browseFoldersButton)
                {
                    console.log("Browse Folders");
                }
                else if(buttonId===optionCtrlObj.browseFilesButton)
                {
                    browsePopUp.selectFiles()

                }
                else
                {
                    //do nothing , Future
                }
            }
        }
    }


}

