#include "backend.h"
#include <QDebug>
#include <QFile>
#include <QTextStream>
#include <QFileDialog>

#define FILE_STATE "GoGo_Recent.txt"

BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
}

QVariant BackEnd::browseAllFilesFromFolder()
{
    QString dir = QFileDialog::getExistingDirectory(0, tr("Open Directory"),"/home",QFileDialog::ShowDirsOnly | QFileDialog::DontResolveSymlinks);
    QStringList result=getAllAudioFilesFromDirRecursively(dir);
    return QVariant::fromValue(result);
}
QStringList BackEnd::getAllAudioFilesFromDirRecursively(QString dirName)
{
    QStringList result;
    QDir dir(dirName);
    //dir.setNameFilters(QStringList("*.mp3,*.wav,*.ogg"));
    dir.setFilter(QDir::Files | QDir::NoDotAndDotDot | QDir::NoSymLinks);

    QStringList fileList = dir.entryList();
    for (int i=0; i<fileList.count(); i++)
    {
        if(fileList[i].endsWith(".mp3")) //This should be changed
        {
            //qDebug() << "Found file: " << QUrl::fromLocalFile(dir.absoluteFilePath(fileList[i])).toString();
            result << QUrl::fromLocalFile(dir.absoluteFilePath(fileList[i])).toString();
        }
    }

    dir.setFilter(QDir::AllDirs | QDir::NoDotAndDotDot | QDir::NoSymLinks);
    QStringList dirList = dir.entryList();
    for (int i=0; i<dirList.size(); ++i)
    {
        QString newPath = QString("%1/%2").arg(dir.absolutePath()).arg(dirList.at(i));
        result<<getAllAudioFilesFromDirRecursively(newPath);
    }
    return result;
}

QVariant BackEnd::browseFiles()
{
    QFileDialog dialog(0);
    dialog.setNameFilter(tr("Music Files (*.mp3 *.wav *.ogg)"));
    QStringList fileNames;
    if (dialog.exec())
        fileNames = dialog.selectedFiles();
    return QVariant::fromValue(fileNames);
}

QVariant BackEnd::previousMediaList()
{
    m_previousMediaList.clear();
    QFile file(FILE_STATE);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return QVariant::fromValue(QStringList());

    QTextStream stream(&file);
    QString line;
    while (stream.readLineInto(&line)) {
        m_previousMediaList<<line;
    }
    file.close();
    return QVariant::fromValue(m_previousMediaList);
}

void BackEnd::setPreviousMediaList(const QVariant& data)
{
    qDebug()<<"Saving files";
    QFile file(FILE_STATE);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text))
        return;

    QTextStream out(&file);
    QStringList files=data.toStringList();
    for(int i=0;i<files.size();i++)
        out<<files[i]<<"\n";
    file.close();
}
