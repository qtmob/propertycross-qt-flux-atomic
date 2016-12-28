import QtQuick 2.7
import QtQuick.Controls 2.0
import "../../logic/actions"
import "../../logic/adapters"

Item {
    anchors.fill: parent
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "property listing"
    }
    Button {
        text: "Back"
        onClicked: StoreTable.modesStore && StoreTable.modesStore.currentMode === "results" ?
            AppActions.showSearchResults() :
            AppActions.showFavorites()
    }
}
