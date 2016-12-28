import QtQml 2.2
import "../actions"
import "../adapters"

QtObject {
    id: appStore
    Component.onCompleted: StoreTable.appStore = this

    readonly property alias appTitle: d.appTitle

    property QtObject d: QtObject {
        id: d
        readonly property string appTitle: "PropertyCross"
    }
}
