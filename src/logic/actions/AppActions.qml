pragma Singleton
import QtQml 2.2

QtObject {

    signal showPropertiesSearch
    signal showSearchResults
    signal showPropertyDetails
    signal showFavorites

    signal searchPropertiesByPlaceName(string place_name)
    signal searchPropertiesByLocation(real lat, real lon)

    signal gotSearchResults(var listings)
    signal gotSearchError()
}
