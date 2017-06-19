import QtQuick 2.0

Image {
    id: truckid
    width : 30
    height :50

    rotation: 180
    property string img
    property bool movedown : false
    property bool isMovingdown :false;
    property int speed : 2
    property int range : 20
    source : img

    Timer {
        interval: 10;
        running: true;
        repeat: true

        onTriggered: {

            parent.y+=speed;
            if (parent.x <rootgame.car[1].x+range && parent.x >rootgame.car[1].x-range  && parent.y <rootgame.car[1].y+range && parent.y >rootgame.car[1].y-range)
            {
                rootgame.car[1].destroy()
                rootgame.stopchrono()
            }
        }
    }
}