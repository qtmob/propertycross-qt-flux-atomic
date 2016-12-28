import QtQml 2.2
import com.cutehacks.duperagent 1.0 as Http
import "../actions"
import "../adapters"

QtObject {
    id: apiStore
    Component.onCompleted: StoreTable.apiStore = this

    property Connections c1: Connections {
        target: AppActions
        onSearchPropertiesByPlaceName: d.searchListings(place_name, 1)
    }

    property QtObject d: QtObject {
        id: d

        readonly property url baseUrl: "http://api.nestoria.co.uk/api"
        readonly property string defaultParams: "?country=uk&pretty=1&encoding=json"
        property var searchResults

        function searchListings(place_name, page) {
            Http.request
            .get(baseUrl+defaultParams)
            .timeout(5000)
            .query({
                      action: "search_listings",
                      listing_type: "buy",
                      place_name: place_name,
                      page: page
                  })
            .end(function (err, res) {
                if (res.status === 200) {
                    var response_code = res.body.response.application_response_code;
                    if (["100","101","110"].indexOf(response_code) !== -1) {
                        AppActions.gotSearchResults(res.body.response.listings);
                    } else {
                        AppActions.gotSearchError(res.body.response.application_response_text)
                    }
                } else {
                    AppActions.gotSearchError("unknown error")
                }
            });
        }
    }
}
