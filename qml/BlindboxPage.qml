import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BilibiliBot 1.0

Page {
    title: "盲盒统计"

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width

        Item { // Use an Item for padding
            width: Math.min(parent.width, 640)
            anchors.horizontalCenter: parent.horizontalCenter
            implicitHeight: blindBoxLayout.implicitHeight + 40

            GridLayout {
                id: blindBoxLayout
                columns: 1
                width: parent.width - 40
                anchors.centerIn: parent
                rowSpacing: 15
                columnSpacing: 15

                Label {
                    text: "盲盒统计"
                    font.pixelSize: 20
                    font.bold: true
                    Layout.fillWidth: true
                    Layout.bottomMargin: 10
                    horizontalAlignment: Text.AlignHCenter
                }
                Label {
                    text: "直播间盲盒开启统计与分析"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.fillWidth: true
                    Layout.bottomMargin: 20
                    horizontalAlignment: Text.AlignHCenter
                }

                RowLayout {
                    Layout.fillWidth: true
                    Switch {
                        id: enableBlindBoxStatsToggle
                        text: "启用盲盒统计功能"
                        checked: true
                    }
                }

                // Data Grid
                GridLayout {
                    Layout.fillWidth: true
                    columns: 2
                    rowSpacing: 10
                    columnSpacing: 10
                    Layout.topMargin: 15

                    Repeater {
                        model: [
                            { valueText: "42", labelText: "今日盲盒" },      // Renamed to avoid conflicts
                            { valueText: "128", labelText: "本周盲盒" },
                            { valueText: "18", labelText: "稀有盲盒" },
                            { valueText: "¥328", labelText: "总价值" }
                        ]
                        delegate: Frame {
                            Layout.fillWidth: true
                            padding: 12
                            background: Rectangle {
                                color: "#f0f0f0" // Mimic data-item background
                                radius: 6
                            }

                            ColumnLayout {
                                anchors.centerIn: parent
                                spacing: 5
                                Label {
                                    text: modelData.valueText // Use renamed property
                                    font.pixelSize: 20
                                    font.bold: true
                                    color: "#e8a798" // Accent color
                                    Layout.alignment: Qt.AlignHCenter
                                }
                                Label {
                                    text: modelData.labelText // Use renamed property
                                    font.pixelSize: 12
                                    color: "gray"
                                    Layout.alignment: Qt.AlignHCenter
                                }
                            }
                        }
                    }
                }

                Label {
                    text: "盲盒价值排行榜"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.topMargin: 15
                }
                ListView {
                    id: blindBoxRankingList
                    Layout.fillWidth: true
                    Layout.preferredHeight: 150
                    clip: true
                    model: ListModel {
                        id: blindBoxRankingModel
                        ListElement { userName: "开盒大师"; itemValue: "¥86" }
                        ListElement { userName: "欧皇降临"; itemValue: "¥74" }
                        ListElement { userName: "幸运星"; itemValue: "¥58" }
                        ListElement { userName: "盒子爱好者"; itemValue: "¥42" }
                    }
                    delegate: ItemDelegate {
                        width: parent.width
                        text: model.userName // Changed to model.userName
                        Label {
                            text: model.itemValue // Changed to model.itemValue
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 10
                            font.pixelSize: 14
                            color: "#333"
                        }
                    }
                    ScrollIndicator.vertical: ScrollIndicator {}
                }

                Label {
                    text: "盲盒开启提示"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.topMargin: 15
                }
                TextField {
                    id: blindBoxOpenMessageInput
                    Layout.fillWidth: true
                    text: "恭喜 {用户名} 开启了{盲盒名}！"
                }

                Button {
                    id: saveBlindBoxSettingsButton
                    text: "保存设置"
                    Layout.fillWidth: true
                    Layout.topMargin: 20
                    highlighted: true
                    onClicked: {
                        // Placeholder for save action
                        console.log("盲盒统计设置已保存");
                    }
                }
            }
        }
    }
}
