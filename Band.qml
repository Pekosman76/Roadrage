import QtQuick 2.0

Rectangle {

    width: 10
    height: 20
    color : "white"

    Timer{

        interval: 30;
        running: true;
        repeat: true

        onTriggered: {
            if(parent.y > 600)
                parent.destroy
            else
                parent.y +=4
        }
    }
}
