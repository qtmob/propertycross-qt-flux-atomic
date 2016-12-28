import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Page {
    id: propertySearchTpl

    property alias busyIndicator: busyIndicator
    property alias titleLabel: titleLabel
    property alias favoritesButton: favoritesButton
    property alias searchInput: searchInput
    property alias searchField: searchField
    property alias clearSearchButton: clearSearchButton
    property alias searchButton: searchButton
    property alias locationButton: locationButton
    property alias searchProblem: searchProblem
    property alias recentSearchesPane: recentSearchesPane
    property alias recentSearchesList: recentSearchesList

    anchors.fill: parent

    header: ToolBar {
        Label {
            id: titleLabel
            anchors.centerIn: parent
        }
        ToolButton {
            id: favoritesButton
            anchors.right: parent.right
            text: "Favorites"
        }
    }

    BusyIndicator {
        id: busyIndicator
        visible: false
        anchors.centerIn: parent
    }

    ColumnLayout {
        visible: !busyIndicator.visible
        anchors.fill: parent
        Pane {
            Layout.fillWidth: true
            Label {
                width: parent.width
                wrapMode: Text.Wrap
                text: "Use the form below to search for houses to buy. You can search by place-name, postcode,"
                      + " or click 'My Location', to search in your current location"
            }
        }
        Pane {
            id: searchPane
            Layout.fillWidth: true
            Layout.preferredHeight: 120
            RowLayout {
                id: searchInput
                signal clearSearch
                onClearSearch: searchField.text = ""
                width: parent.width
                TextField {
                    id: searchField
                    Layout.fillWidth: true
                }
                Button {
                    id: clearSearchButton
                    Layout.preferredWidth: 40
                    text: "X"
                    onClicked: parent.clearSearch()
                    enabled: searchField.displayText !== ""
                }
            }
            Row {
                anchors.top: searchInput.bottom
                anchors.topMargin: 16
                width: parent.width
                spacing: 16
                Button {
                    id: searchButton
                    text: "Go"
                }
                Button {
                    id: locationButton
                    text: "My location"
                }
            }
        }
        Pane {
            id: searchProblem
            Layout.fillHeight: true
            Layout.fillWidth: true
            Label {
                anchors.top: parent.top
                text: "There was a problem with your search"
            }
        }
        Pane {
            id: recentSearchesPane
            visible: !searchProblem.visible
            Layout.fillHeight: true
            Layout.fillWidth: true
            Label {
                id: recentSearcheslabel
                text: "Recent searches:"
            }
            Column {
                id: recentSearchesSizer
                anchors.top: recentSearcheslabel.bottom
                width: parent.width
                Repeater {
                    id: recentSearchesList
                    model: 4
                    ItemDelegate {
                        width: recentSearchesSizer.width
                        text: "Search #%1 (%2)".arg(index+1).arg(Math.round(Math.random()*10))
                    }
                }
            }
        }
    }
}
