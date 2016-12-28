import QtQml 2.2
import com.cutehacks.gel 1.0
import "../actions"
import "../adapters"

QtObject {
    id: searchResultsStore

    Component.onCompleted: StoreTable.searchResultsStore = this

    readonly property alias listingsModel: d.listingsModel

    property Connections c1: Connections {
        target: AppActions
        onGotSearchResults: {
            d.listingsModel.clear();
            d.listingsModel.add(listings);
            AppActions.showSearchResults();
        }
    }

    property QtObject d: QtObject {
        id: d

        readonly property JsonListModel listingsModel: JsonListModel {
            idAttribute: "lister_url"
        }
    }
}
