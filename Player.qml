import QtQuick 2.0

Item{
    Engine
    {
        id:playEngine
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
        spacing: 10
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
            height: parent.height/4
            Component.onCompleted:
            {
                playControlObj.clicked.connect(onClickEvent)
            }
            function onClickEvent(buttonId)
            {
                if(buttonId===playControlObj.previousButton)
                {
                    console.log("Previous");
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
                     console.log(playEngine.author+","
                                 +playEngine.title+","
                                 +playEngine.subTitle+","
                                 +playEngine.albumArtist+","
                                 +playEngine.albumTitle+","
                                 +playEngine.coverArtUrlSmall+","         );
                    playbackInfo.title=playEngine.title

                }
                else
                {
                    //do nothing , Future
                }
            }
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

