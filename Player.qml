import QtQuick 2.0

Item{
    id:playerMainObj
    //TODO: Do we need this, Or let the player control everyone ?
    signal playbackStatusPlaying()
    //signal playbackStatusPaused()
    signal playbackStatusStopped()
    signal songChanged()
    Engine
    {
        id:playEngine
        Component.onCompleted: {
            playEngine.playerBackend.playbackStateChanged.connect(onBackendPlaybackStatusChanged)
            playEngine.playerBackend.positionChanged.connect(onBackEndPositionChanged)
        }


        function onBackEndPositionChanged()
        {
            //TODO: Dirty way , lets clean up later
            //console.log("Updating Position"+playEngine.playerBackend.position)
            playbackSlider.maxValue=playEngine.playerBackend.duration
            playbackSlider.currentValue=playEngine.playerBackend.position
        }

        function onBackendPlaybackStatusChanged()
        {
            updateUI()
            if(playEngine.getPlaybackStatus()===playEngine.playing)
            {

            }
            else if(playEngine.getPlaybackStatus()===playEngine.paused)
            {

            }
            else if(playEngine.getPlaybackStatus()===playEngine.stopped)
            {
                playerMainObj.playbackStatusStopped()
            }
            else
            {
                console.error("Unknown Playback Status")
            }
        }
    }

    function updateUI()
    {
        console.log("Updating the UI for playback change")
        playbackSlider.maxValue=playEngine.playerBackend.duration
        playbackSlider.minValue=0
        playbackSlider.currentValue=playEngine.playerBackend.position

        console.log(playEngine.author+","
                    +playEngine.title+","
                    +playEngine.subTitle+","
                    +playEngine.albumArtist+","
                    +playEngine.albumTitle+","
                    +playEngine.coverArtUrlSmall+","         );
        playbackInfo.title=playEngine.title;
        //TODO Update the list selected items.Not working
        //playListObj.currentIndex=playEngine.getCurrentIndex()
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
            console.log("Adding Multiple files")
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
                    console.log("Click on Play Pause")

                    if(playEngine.getPlaybackStatus()===playEngine.playing)
                    {
                        console.log("Playing, now pausing")
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

