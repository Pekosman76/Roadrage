import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {

    id : rootgame
    width: 300
    height: 500
    color : "grey"

    focus: true

    property int intervaltruck : 2500
    property int intervalcars : 3500
    property int intervalf1 : 4500
    property int intervalbonus :8000

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

    Component.onCompleted: {

        car[1]= carcomponent.createObject(parent, {"x":(rootgame.width/2)-15, "y": rootgame.height-50, "img": "qrc:/Assets/car.png"});
        chrono.startd= true
    }


    Timer {

        interval: 300;
        running: true;
        repeat: true

        onTriggered: {

            band[l]=bandcomponent.createObject(parent, {"x":100, "y": 0});
            l++
            band[l]=bandcomponent.createObject(parent, {"x":200, "y": 0});
            l++
        }


    }

    Timer {
        interval: intervaltruck;
        running: true;
        repeat: true

        onTriggered: {

            truck[i]=truckcomponent.createObject(parent, {"x":35, "y": -5, "img": "qrc:/Assets/truck.png", "isMovingdown" : true});
            i++;
            intervaltruck= getNumber()
        }
    }

    Timer {
        interval: intervalcars;
        running: true;
        repeat: true

        onTriggered: {

            cars[j]=carscomponent.createObject(parent, {"x":135, "y": -5, "img": "qrc:/Assets/cars.png", "isMovingdown" : true});
            j++;
            intervalcars = getNumber()
        }
    }

    Timer {
        interval: intervalf1;
        running: true;
        repeat: true

        onTriggered: {

            f1[k]=f1component.createObject(parent, {"x":235, "y": 0, "img": "qrc:/Assets/f1.png", "isMovingdown" : true});
            k++;
            intervalf1 = getNumber()
        }
    }

    Time{

        id : chrono
        anchors.top : parent.top
        anchors.right : parent.right
    }

    Keys.onPressed: {

        if (event.key === Qt.Key_Left) {
            if (car[1].x===35) return;
            else
            {
                car[1].x -= 100
            }
        }

        if (event.key ===  Qt.Key_Right) {
            if (car[1].x===235) return;
            else{

                car[1].x += 100
            }
        }
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

