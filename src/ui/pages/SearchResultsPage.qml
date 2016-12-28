import QtQuick 2.7
import QtQuick.Controls 2.0
import "../../logic/actions"
import "../../logic/adapters"

Item {
    anchors.fill: parent
    Text {
        anchors.centerIn: parent
        text: "search results"
    }
    Button {
        id: btn
        text: "Back"
        onClicked: AppActions.searchProperties()
    }
    ItemDelegate {
        anchors.top: btn.bottom
        text: "Property 1"
        width: parent.width
        onClicked: AppActions.showPropertyDetails()
    }
}
