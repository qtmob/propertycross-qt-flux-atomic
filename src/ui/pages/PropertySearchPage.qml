import QtQuick 2.7
import QtQuick.Controls 2.0
import "../../logic/actions"

Item {
    anchors.fill: parent
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "property search"
    }
    Button {
        text: "Back"
        onClicked: AppActions.searchProperties()
    }
    Button {
        anchors.right: parent.right
        text: "Faves"
        onClicked: AppActions.showFavorites()
    }
    Button {
        anchors.centerIn: parent
        text: "Go"
        onClicked: AppActions.showSearchResults()
    }
}
