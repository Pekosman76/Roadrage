import QtQuick 2.0

Rectangle {

    width: 8
    height: 20
    color : "white"

    Timer{

        interval: 15;
        running: true;
        repeat: true

        onTriggered: {
            if(parent.y > rootgame.height)
                parent.destroy
            else
                parent.y +=4
        }
    }
}
