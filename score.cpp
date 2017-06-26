#include "score.h"
#include "QDebug"
#include <QDir>



score::score(QObject *parent) : QObject(parent)
{

    myfilename = QDir::currentPath()+"/score.txt";
}

QString score::readfile()
{
    QFile file(myfilename);
    if(!file.open(QIODevice::ReadOnly)) {

    }

    QTextStream in(&file);
    QString line;

    line = in.readLine();
    return line;
}

void score::writefile(QString score)
{
    QString tscore = score;
    score = score.remove(3,1);

    int actuscore = score.toInt();

    QString last = readfile();
    last = last.remove(3,1);

    if (actuscore > last.toInt())
    {

        QFile file(myfilename);
        if(!file.open(QIODevice::WriteOnly)) {

        }
        myfilename.clear();
        QTextStream in(&file);
        in <<tscore;
    }
}

