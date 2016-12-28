import QtQuick 2.7
import QtQuick.Controls 2.0

Page {
    id: searchResultsTpl

    property alias backButton: backButton
    property alias searchResultsList: searchResultsList

    anchors.fill: parent

    header: ToolBar {
        Label {
            anchors.centerIn: parent
            text: "search results"
        }
        ToolButton {
            id: backButton
            text: "Back"
        }
    }
    ListView {
        id: searchResultsList
        anchors.fill: parent
    }
}
