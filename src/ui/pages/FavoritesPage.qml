import QtQuick 2.7
import QtQuick.Controls 2.0
import "../../logic/actions"

Item {
    anchors.fill: parent
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "favorites"
    }
    Button {
        id: back
        text: "Back"
        onClicked: AppActions.searchProperties()
    }
    ItemDelegate {
        anchors.top: back.bottom
        width: parent.width
        text: "Property 1"
        onClicked: AppActions.showPropertyDetails()
    }
}
