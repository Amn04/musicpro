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
    property alias title:player.title
    property alias subTitle:player.subTitle
    property alias category:player.category
    property alias author:player.author
    property alias albumTitle:player.albumTitle
    property alias albumArtist:player.albumArtist
    property alias genre:player.genre
    property alias coverArtUrlSmall:player.coverArtUrlSmall
    property alias playlist: playlist
    Playlist
    {
        id:playlist;
    }

    MediaPlayer
    {
        id:player;
        playlist: playlist
        readonly property string title: !!metaData.title? qsTr("%1").arg(metaData.title):"metaData.title"
        readonly property string subTitle: !!metaData.subTitle? qsTr("%1").arg(metaData.subTitle):""
        readonly property string category: !!metaData.category? qsTr("%1").arg(metaData.category):""
        readonly property string author: !!metaData.author? qsTr("%1").arg(metaData.author):"metaData.author"
        readonly property string albumTitle: !!metaData.albumTitle? qsTr("%1").arg(metaData.albumTitle):"No Album Title"
        readonly property string albumArtist: !!metaData.albumArtist? qsTr("%1").arg(metaData.albumArtist):"No Album Artist"
        readonly property string coverArtUrlSmall: !!metaData.coverArtUrlSmall? qsTr("%1").arg(metaData.coverArtUrlSmall):""
        readonly property string genre: !!metaData.genre? qsTr("%1").arg(metaData.genre):""
       // onPositionChanged:
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

    function play()
    {
        player.play()
        playEngine.playbackstatus=playing
    }

    function playAtIndex(index)
    {
       playlist.currentIndex=index
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
