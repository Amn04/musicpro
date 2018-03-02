import QtQuick 2.0
import QtMultimedia 5.9

Item {
    id:playEngine
    visible: false
    property int playing:0
    property int paused:1
    property int stopped:2
    property int playbackstatus:2
    Playlist
    {
        id:playlist;
    }

    MediaPlayer
    {
        id:player;
        playlist: playlist
    }

    function getPlaybackStatus()
    {
       return playEngine.playbackstatus;
    }

    function play()
    {
        player.play()
        playEngine.playbackstatus=playing
    }

    function pause()
    {
        player.pause()
        playEngine.playbackstatus=paused
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
