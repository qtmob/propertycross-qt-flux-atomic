import QtQml 2.2
import "../../logic/actions"
import "../../logic/adapters"
import "../templates"

PropertySearchTpl {
   id: propertySearchPage

   busyIndicator.visible: false
   Connections {
       target: AppActions
       onSearchPropertiesByPlaceName: busyIndicator.visible = true
       onGotSearchResults: busyIndicator.visible = false
       onGotSearchError: busyIndicator.visible = false
   }

   titleLabel.text: StoreTable.appStore.appTitle

   favoritesButton.onClicked: AppActions.showFavorites()
   favoritesButton.enabled: false

   searchButton.onClicked: AppActions.searchPropertiesByPlaceName(searchField.text)
   searchButton.enabled: searchField.displayText !== ""

   locationButton.enabled: false

   searchProblem.visible: false
   Connections {
       target: AppActions
       onSearchPropertiesByPlaceName: searchProblem.visible = false
       onGotSearchResults: searchProblem.visible = false
       onGotSearchError: searchProblem.visible = true
   }

   recentSearchesPane.enabled: false
}
