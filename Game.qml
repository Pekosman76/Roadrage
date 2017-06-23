import QtQuick 2.0

Rectangle {

    id : rootgame
    width: parent.width
    height: parent.height
    color : "grey"

    focus: true

    property int intervaltruck : 2500
    property int intervalcars : 4000
    property int intervalf1 : 6000

    property var carcomponent :Qt.createComponent("Car.qml")
    property var car :[]

    property var truckcomponent :Qt.createComponent("Truck.qml")
    property var truck :[]

    property var carscomponent :Qt.createComponent("Cars.qml")
    property var cars :[]

    property var f1component :Qt.createComponent("F1.qml")
    property var f1 :[]

    property var bandcomponent :Qt.createComponent("Band.qml")
    property var band :[]

    property int i :1
    property int j :1
    property int k :1
    property int l :1

    property string finaltime : chrono.tim



    SwipeArea {

        id: mouse
        anchors.fill: parent
        onSwipe: {
            switch (direction) {
            case "left":
                if (car[1].x===((parent.width/3)/2)-15) break;
                else
            {
                car[1].x -= (parent.width/3)
            }
            break

            case "right":
                if (car[1].x===((parent.width/3)+(parent.width/2))-15) break;
                else{

                car[1].x += (parent.width/3)
            }
            break
            }
        }
    }

    Component.onCompleted: {

    }

    Timer {

        interval: 10;
        running: rootgame.visible;
        repeat: false
        onTriggered: {

            car[1]= carcomponent.createObject(parent, {"x":(rootgame.width/2)-15, "y": rootgame.height-50, "img": "qrc:/Assets/car.png"});
            chrono.startd= true
        }
    }

    Timer {

        interval: 300;
        running: rootgame.visible;
        repeat: true

        onTriggered: {

            band[l]=bandcomponent.createObject(parent, {"x":parent.width/3, "y": -50});
            l++
            band[l]=bandcomponent.createObject(parent, {"x":(parent.width/3)*2, "y": -50});
            l++
        }


    }

    Timer {
        interval: intervaltruck;
        running: rootgame.visible;
        repeat: true

        onTriggered: {

            truck[i]=truckcomponent.createObject(parent, {"x": ((parent.width/3)/2)-15, "y": 0, "img": "qrc:/Assets/truck.png", "isMovingdown" : true});
            i++;
            intervaltruck= getNumber()
        }
    }

    Timer {
        interval: intervalcars;
        running: rootgame.visible;
        repeat: true

        onTriggered: {

            cars[j]=carscomponent.createObject(parent, {"x": ((parent.width/2))-15, "y": -20, "img": "qrc:/Assets/cars.png", "isMovingdown" : true});
            j++;
            intervalcars = getNumber()
        }
    }

    Timer {
        interval: intervalf1;
        running: rootgame.visible;
        repeat: true

        onTriggered: {

            f1[k]=f1component.createObject(parent, {"x":((parent.width/3)+(parent.width/2))-15, "y": -20, "img": "qrc:/Assets/f1.png", "isMovingdown" : true});
            k++;
            intervalf1 = getNumber()
        }
    }

    Time{

        id : chrono
        anchors.top : parent.top
        anchors.right : parent.right

    }

    function randomNumber() {
        return Math.random()*(4000)+2000;
    }

    function getNumber() {
        return rootgame.randomNumber();
    }

    function stopchrono(){
        chrono.startd = false
    }

    Timer {
        interval: 45000;
        running: true;

        onTriggered: {

            rootgame.color = "#1756CD"
        }
    }
    Timer {
        interval: 60000;
        running: true;

        onTriggered: {

            rootgame.color = "#54D23A"
        }
    }
    Timer {
        interval: 75000;
        running: true;

        onTriggered: {

            rootgame.color = "#1CCEDF"
        }
    }
}

