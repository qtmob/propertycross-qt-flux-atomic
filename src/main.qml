import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQml.StateMachine 1.0 as DSM
import "logic/actions"
import "logic/adapters"
import "logic/stores"
import "ui/pages"

ApplicationWindow {
    id: qmlApp

    property bool debugMode: false

    visible: true
    width: 320
    height: 480

    AppStore {}
    ModesStore {}
    ApiStore {}
    SearchResultsStore {}

    DSM.StateMachine {

        running: true

        initialState: propertySearchState

        DSM.State {
            id: propertySearchState
            onEntered: propertySearchPage.visible = true
            onExited: propertySearchPage.visible = false
            DSM.SignalTransition {
                targetState: searchResultsState
                signal: AppActions.showSearchResults
            }
            DSM.SignalTransition {
                targetState: favoritesState
                signal: AppActions.showFavorites
            }
        }
        DSM.State {
            id: searchResultsState
            onEntered: searchResultsPage.visible = true
            onExited: searchResultsPage.visible = false
            DSM.SignalTransition {
                targetState: propertySearchState
                signal: AppActions.showPropertiesSearch
            }
            DSM.SignalTransition {
                targetState: propertyListingState
                signal: AppActions.showPropertyDetails
            }
        }
        DSM.State {
            id: propertyListingState
            onEntered: propertyListingPage.visible = true
            onExited: propertyListingPage.visible = false
            DSM.SignalTransition {
                targetState: searchResultsState
                signal: AppActions.showSearchResults
            }
            DSM.SignalTransition {
                targetState: favoritesState
                signal: AppActions.showFavorites
            }
        }
        DSM.State {
            id: favoritesState
            onEntered: favoritesPage.visible = true
            onExited: favoritesPage.visible = false
            DSM.SignalTransition {
                targetState: propertySearchState
                signal: AppActions.showPropertiesSearch
            }
            DSM.SignalTransition {
                targetState: propertyListingState
                signal: AppActions.showPropertyDetails
            }
        }
    }

    PropertySearchPage {
        id: propertySearchPage
        visible: false
    }
    SearchResultsPage {
        id: searchResultsPage
        visible: false
    }
    PropertyListingPage {
        id: propertyListingPage
        visible: false
    }
    FavoritesPage {
        id: favoritesPage
        visible: false
    }

    Text {
        visible: debugMode
        anchors.bottom: parent.bottom
        text: StoreTable.modesStore.currentMode
    }
}
