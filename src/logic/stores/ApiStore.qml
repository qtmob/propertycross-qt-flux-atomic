import QtQml 2.2
import "../actions"
import "../adapters"

QtObject {
    id: apiStore
    Component.onCompleted: StoreTable.apiStore = this

    property QtObject d: QtObject {
        id: d
    }
}
