import QtQuick.Controls 2.0
import "../templates"
import "../../logic/actions"
import "../../logic/adapters"

SearchResultsTpl {
    backButton.onClicked: AppActions.showPropertiesSearch()
    searchResultsList.model: StoreTable.searchResultsStore.listingsModel
    searchResultsList.delegate: ItemDelegate {
        enabled: false
        contentItem: Label {
            text: "%1\n%2".arg(model.price_formatted).arg(model.title)
            wrapMode: Label.Wrap
            maximumLineCount: 2
            elide: Label.ElideRight
        }
        width: searchResultsList.width
        onClicked: AppActions.showPropertyDetails()
    }
}
