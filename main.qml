import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    width: 300
    height: 500
    title: qsTr("!!! ROAD RAGE !!!")

     visibility: version === "mobile" ? "FullScreen" : "Windowed"


    Game{
        id : game
        visible: false
        width: parent.width
        height: parent.height
    }
    Menu{
        id : home
        visible: true
        width: parent.width
        height: parent.height
    }
}

