import "../../logic/actions"
import "../../logic/adapters"
import "../templates"

PropertySearchTpl {
   id: propertySearchPage

   titleLabel.text: StoreTable.appStore.appTitle

   favoritesButton.onClicked: AppActions.showFavorites()
   favoritesButton.enabled: false

   searchButton.onClicked: AppActions.showSearchResults()

   locationButton.enabled: false

   searchProblem.visible: false

   recentSearchesPane.enabled: false
}
