import QtQuick 2.0
import QtMultimedia 5.9

Item {
    id:playEngine
    visible: false
    property int playing:0
    property int paused:1
    property int stopped:2
    property int playbackstatus:2
    //TODO:Dont expose this object,anti pattern
    property alias playerBackend: player
    property alias playlist: playlist
    signal newMediaStarted()
    signal playbackChanged()
    Playlist
    {
        id:playlist;
    }

    MediaPlayer
    {
        id:player;
        playlist: playlist


        onStatusChanged:
        {
            //console.log("step 1 :"+player.status)
            if(player.status==2) //TODO : Status sort hack
            {
                playEngine.newMediaStarted()

            }
            else
            {
                // console.log("Some Status Else" + player.title)
            }

        }


        onPlaybackStateChanged:
        {
            playEngine.playbackChanged()
        }

        Component.onCompleted:
        {
            Connections
            {
                target:playEngine.player

            }
        }
    }

    function getPlayListItems()
    {
        var listOfFiles=[]
        console.log("Playlist Count "+playlist.itemCount)
        for(var i = 0; i < playlist.itemCount; i++) {
            listOfFiles.push(playlist.itemSource(i))
        }
        return listOfFiles
    }

    function getPlaybackStatus()
    {
        return playEngine.playbackstatus;
    }

    function next()
    {
        playlist.next()
    }

    function previous()
    {
        playlist.previous()
    }

    function getCurrentIndex()
    {
        return playlist.currentIndex
    }

    function play()
    {
        player.play()
        playEngine.playbackstatus=playing
        playEngine.playbackChanged()
    }

    function playAtIndex(index)
    {
        playlist.currentIndex=index
        playEngine.playbackChanged()
    }

    function pause()
    {
        player.pause()
        playEngine.playbackstatus=paused
        playEngine.playbackChanged()
    }

    function clear()
    {
        playlist.clear()
    }

    function add(fileUrl)
    {
        playlist.addItem(fileUrl)
    }

    function addMultiple(fileUrls)
    {
        playlist.addItems(fileUrls)
    }

}
