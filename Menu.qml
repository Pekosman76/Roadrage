import QtQuick 2.5
import QtGraphicalEffects 1.0

Rectangle {
    id: item1

    width: parent.width
    height: parent.height

    focus : home.focus
    property string winner :"Player "

    RadialGradient {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "white" }
            GradientStop { position: 0.7; color: "#A69C9C" }
        }
    }

    onVisibleChanged: {
        win.text =  "BEST SCORE : "+ scores.readfile()
    }

    Text{

        id: titre
        font.family: "DejaVu Sans"
        font.bold: true
        style: Text.Outline
        text: "ROADRAGE"
        color :"#BC4B4B"
        font.pixelSize: parent.width/8
        anchors.bottom: buttonLaunchGame.top
        anchors.bottomMargin: 40
        anchors.horizontalCenter:  parent.horizontalCenter

    }

    DropShadow {
        anchors.fill: titre
        horizontalOffset: 5
        verticalOffset: 8
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: titre
    }

    Text{

        id: win
        color: "#BC4B4B"
        font.family: "URW Bookman L"
        font.bold: true
        text: "BEST SCORE : "+ scores.readfile()
        anchors.topMargin: 70
        font.pixelSize: parent.width/15
        anchors.top: buttonLaunchGame.bottom
        anchors.horizontalCenter:  parent.horizontalCenter
    }

    Rectangle {
        id: buttonLaunchGame
        width: parent.width/2
        height: parent.width/4
        color : "white"
        border.color: "#BC4B4B"
        border.width: 8
        scale: 0.8
        radius: 25
        anchors.centerIn: parent

        Text {
            id: launchGame
            text: qsTr("PLAY")
            color : "#BC4B4B"
            font.family: "DejaVu Sans"
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: parent.width/4
        }

        MouseArea {
            id: mouseAreaLaunchGame
            anchors.fill: parent
            onReleased: {
                home.visible= false
                home.focus = false
                game.visible =true
                game.focus = true
            }
        }

        PropertyAnimation on scale {  from: buttonLaunchGame.scale;to: 1.2; duration: 2000; loops: Animation.Infinite }
    }


}

