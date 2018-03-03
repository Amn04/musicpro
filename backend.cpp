#include "backend.h"
#include <QDebug>
#include <QFile>
#include <QTextStream>

#define FILE_STATE "GoGo_Recent.txt"

BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
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
