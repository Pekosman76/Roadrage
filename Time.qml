import QtQuick 2.0

Item {

    width: 120;
    height: 30;

    visible: true
    Component.onCompleted: {
        ["textFormat", "fontSizeMode", "minimumPixelSize", "verticalAlignment", "horizontalAlignment", "font"].forEach (function (prop) {
            shadow [prop] = Qt.binding (function () {
                return label [prop];
            });
        });
    }

    property real msecs : 0;
    property int hue : 0;
    property bool startd : false

    Timer {
        id: timerchrono
        repeat: true;
        running: startd;
        interval: 60;
        onTriggered: { msecs += interval; }
    }

    FontLoader {
        id: loader;

    }

    Text {
        id: shadow;
        text: label.text.replace (/\d/g, "8");
        color: "gray";
        opacity: 0.15;
        anchors.fill: parent;
    }

    Text {
        id: label;
        color: "#ebebeb"
        text: (" " + Qt.formatTime (new Date (msecs - 3600000), "mm:ss").substr (0, 10) + " ");
        focus: true;
        textFormat: Text.PlainText;
        fontSizeMode: Text.Fit;
        minimumPixelSize: 10;
        verticalAlignment: Text.AlignVCenter;
        horizontalAlignment: Text.AlignHCenter;
        font {
            italic: true;
            weight: Font.Light;
            family: loader.name;
            pixelSize: 10000;
        }
        anchors.fill: parent;
    }
}
