import QtQuick 2.0
import QtMultimedia 5.0

Item {
    id: root
    anchors.fill: parent
    property int gameState: 0

    onGameStateChanged: {
        if(root.gameState) {

            startSound.stop()
        }
        else{
            startSound.play()
        }
    }

    Audio{
        id: startSound
        source: "qrc:/Assets/ca.mp3"
        loops : Audio.Infinite
    }

}

