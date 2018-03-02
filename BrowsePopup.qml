import QtQuick 2.0
import Qt.labs.folderlistmodel 2.1
import QtQuick.Dialogs 1.0

Item {
    id:browseFiles
    signal listofSelectedFiles(variant fileList)
    FileDialog {
        id: fileDialog
        visible: false;
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {
            if(fileDialog.selectFolder)
            {
                //console.log("Folder: " + fileDialog.fileUrl)
                //getAllFiles(fileDialog.fileUrl)
            }
            else
            {
                console.log("Files: " + fileDialog.fileUrls)
                browseFiles.listofSelectedFiles(fileDialog.fileUrls)
            }
        }
        onRejected: {
           // console.log("Canceled")
        }
        //Component.onCompleted: visible = true
    }



    function selectFolder()
    {
//        fileDialog.title="Select Music Folder"
//        fileDialog.selectFolder=true
//        fileDialog.selectMultiple=false;
//        fileDialog.open()
    }

    function selectFiles()
    {
        fileDialog.title="Select Music File(s)"
        fileDialog.selectMultiple=true
        fileDialog.selectFolder=false

        fileDialog.open()
    }

    FolderListModel
    {
        id:musicDataModel
        showDirs: true
       // nameFilters: ["*.mp3"]
    }

    //QT BUG: TODO FOlderlistmodel is not populating all the subfolders.
//    function getAllFiles(selectedFolder)
//    {
//        console.log("Sel+"+selectedFolder)
//        var listOfFiles=[]
//        musicDataModel.folder=""
//        musicDataModel.folder=selectedFolder
//        while (musicDataModel.canFetchMore()) {}
//        console.log("Datamodel URL"+musicDataModel.folder+","+musicDataModel.count)

//        for (var i=0; i<musicDataModel.count; i++) {
//            var isFolder = musicDataModel.get(i,"fileIsDir")
//            var item = musicDataModel.get(i,"filePath")
//            if(isFolder)
//            {
//                console.log(item+": It is folder");
//                var result=getAllFiles(item);
//                listOfFiles.push(result)
//            }
//            else
//            {
//                console.log(item)
//                listOfFiles.push(item)
//            }
//        }
//        return listOfFiles
//    }
}
