import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BilibiliBot 1.0

Page {
    title: "PK功能设置"

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width

        Item { // Use an Item for padding
            width: Math.min(parent.width, 640)
            anchors.horizontalCenter: parent.horizontalCenter
            implicitHeight: pkLayout.implicitHeight + 40

            GridLayout {
                id: pkLayout
                columns: 1
                width: parent.width - 40
                anchors.centerIn: parent
                rowSpacing: 15
                columnSpacing: 15

                Label {
                    text: "PK功能设置"
                    font.pixelSize: 20
                    font.bold: true
                    Layout.fillWidth: true
                    Layout.bottomMargin: 10
                    horizontalAlignment: Text.AlignHCenter
                }
                Label {
                    text: "PK对手识别与相关设置"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.fillWidth: true
                    Layout.bottomMargin: 20
                    horizontalAlignment: Text.AlignHCenter
                }

                RowLayout {
                    Layout.fillWidth: true
                    Switch {
                        id: enablePKFeatureToggle
                        text: "启用PK功能"
                        checked: true
                    }
                }

                Label {
                    text: "PK开始提示"
                    font.pixelSize: 14
                    color: "gray"
                }
                TextField {
                    id: pkStartMessageInput
                    Layout.fillWidth: true
                    text: "PK开始了，大家加油！"
                }

                Label {
                    text: "PK结束提示"
                    font.pixelSize: 14
                    color: "gray"
                }
                TextField {
                    id: pkEndMessageInput
                    Layout.fillWidth: true
                    text: "PK结束，感谢大家的支持！"
                }

                Label {
                    text: "对方主播信息提示"
                    font.pixelSize: 14
                    color: "gray"
                }
                TextField {
                    id: opponentInfoMessageInput
                    Layout.fillWidth: true
                    text: "当前PK对手：{主播名}，粉丝数：{粉丝数}"
                }

                Label {
                    text: "对方用户串门识别"
                    font.pixelSize: 14
                    color: "gray"
                }
                TextField {
                    id: opponentVisitorMessageInput
                    Layout.fillWidth: true
                    text: "欢迎来自{对方主播}直播间的{用户名}！"
                }

                Label {
                    text: "PK目标设置"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.topMargin: 15
                }
                TextField {
                    id: pkTargetInput
                    Layout.fillWidth: true
                    placeholderText: "输入对方主播ID..."
                }
                Button {
                    id: getOpponentInfoButton
                    text: "获取主播信息"
                    Layout.fillWidth: true
                    Layout.topMargin: 10
                    // Style to mimic btn-outline if needed
                    onClicked: {
                        // Placeholder for action
                        console.log("获取主播信息: " + pkTargetInput.text);
                    }
                }

                Label {
                    text: "PK历史记录"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.topMargin: 15
                }
                ListView {
                    id: pkHistoryListView
                    Layout.fillWidth: true
                    Layout.preferredHeight: 120
                    clip: true
                    model: ListModel {
                        id: pkHistoryModel
                        // Corrected ListElement syntax if it was an issue.
                        // Standard ListElement syntax is `ListElement { propertyName: value; propertyName2: value2 }`
                        ListElement { opponentName: "游戏主播小张"; record: "3胜2负" }
                        ListElement { opponentName: "音乐达人小王"; record: "5胜1负" }
                        ListElement { opponentName: "美食博主小李"; record: "2胜2负" }
                    }
                    delegate: ItemDelegate {
                        width: parent.width
                        text: model.opponentName // Changed to model.opponentName
                        Label {
                            text: model.record // Changed to model.record
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.rightMargin: 10
                            font.pixelSize: 14
                            color: "#333"
                        }
                    }
                    ScrollIndicator.vertical: ScrollIndicator {}
                }

                Button {
                    id: savePKSettingsButton
                    text: "保存设置"
                    Layout.fillWidth: true
                    Layout.topMargin: 20
                    highlighted: true
                    onClicked: {
                        // Placeholder for save action
                        console.log("PK功能设置已保存");
                    }
                }
            }
        }
    }
}
