import QtQml 2.2
import "../actions"
import "../adapters"

QtObject {
    id: modesStore
    Component.onCompleted: StoreTable.modesStore = this

    readonly property alias currentMode: d.currentMode

    property Connections c1: Connections {
        target: AppActions
        onShowSearchResults: d.currentMode = "results"
        onShowFavorites: d.currentMode = "favorites"
        onShowPropertiesSearch: d.currentMode = ""
    }

    property QtObject d: QtObject {
        id: d
        property string currentMode
    }
}
