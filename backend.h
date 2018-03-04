#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <QVariant>
class BackEnd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariant  previousMediaList READ previousMediaList WRITE setPreviousMediaList)

public:
    explicit BackEnd(QObject *parent = nullptr);

    QVariant  previousMediaList();
    void setPreviousMediaList(const QVariant& data);
    Q_INVOKABLE QVariant browseFiles();
    Q_INVOKABLE QVariant browseAllFilesFromFolder();

protected:
    QStringList getAllAudioFilesFromDirRecursively(QString dirName);
private:
    //TODO:Remove this !
    QStringList m_previousMediaList;
};

#endif // BACKEND_H
