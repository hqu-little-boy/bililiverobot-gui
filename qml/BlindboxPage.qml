import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BilibiliBot 1.0
import "components"

ScrollView {
    id: root
    
    ColumnLayout {
        width: root.width
        spacing: 20
        
        // 页面标题
        Text {
            text: "盲盒统计"
            font.pixelSize: 24
            font.weight: Font.Medium
            color: "#333333"
        }
        
        // 盲盒统计卡片
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 650
            radius: 8
            color: "#ffffff"
            
            // 使用纯QML阴影效果替代DropShadow
            Rectangle {
                anchors.fill: parent
                anchors.topMargin: 2
                color: "#10000000"
                radius: parent.radius
                opacity: 0.1
                z: -1
            }
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 25
                spacing: 20
                
                // 卡片标题
                Row {
                    spacing: 10
                    Text {
                        text: "📦"
                        font.pixelSize: 18
                    }
                    Text {
                        text: "直播间盲盒开启统计与分析"
                        font.pixelSize: 18
                        font.weight: Font.Medium
                        color: "#333333"
                    }
                }
                
                Rectangle {
                    Layout.fillWidth: true
                    height: 1
                    color: "#f0f0f0"
                }

                
                // 启用开关
                RowLayout {
                    Layout.fillWidth: true
                    
                    ToggleSwitch {
                        id: enableBlindBoxStatsToggle
                        checked: true
                    }
                    Text {
                        text: "启用盲盒统计功能"
                        font.pixelSize: 14
                        color: "#333333"
                    }
                }

                // 统计数据
                Column {
                    Layout.fillWidth: true
                    spacing: 8
                    
                    Text {
                        text: "统计数据"
                        font.pixelSize: 14
                        color: "#666666"
                    }
                    GridLayout {
                        Layout.fillWidth: true
                        columns: 2
                        rowSpacing: 10
                        columnSpacing: 10

                        Repeater {
                            model: [
                                { valueText: "42", labelText: "今日盲盒" },
                                { valueText: "128", labelText: "本周盲盒" },
                                { valueText: "18", labelText: "稀有盲盒" },
                                { valueText: "¥328", labelText: "总价值" }
                            ]
                            delegate: Rectangle {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 80
                                color: "#f8f9fa"
                                radius: 6
                                border.color: "#e9ecef"
                                border.width: 1

                                ColumnLayout {
                                    anchors.centerIn: parent
                                    spacing: 5
                                    
                                    Text {
                                        text: modelData.valueText
                                        font.pixelSize: 20
                                        font.weight: Font.Bold
                                        color: "#e8a798"
                                        horizontalAlignment: Text.AlignHCenter
                                    }
                                    Text {
                                        text: modelData.labelText
                                        font.pixelSize: 12
                                        color: "#6c757d"
                                        horizontalAlignment: Text.AlignHCenter
                                    }
                                }
                            }
                        }
                    }
                }

                // 盲盒价值排行榜
                Column {
                    Layout.fillWidth: true
                    spacing: 8
                    
                    Text {
                        text: "盲盒价值排行榜"
                        font.pixelSize: 14
                        color: "#666666"
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
                            width: blindBoxRankingList.width
                            height: 40
                            
                            Rectangle {
                                anchors.fill: parent
                                color: parent.hovered ? "#f5f5f5" : "transparent"
                                radius: 4
                                
                                RowLayout {
                                    anchors.fill: parent
                                    anchors.margins: 10
                                    
                                    Text {
                                        text: model.userName
                                        font.pixelSize: 14
                                        color: "#666666"
                                        Layout.fillWidth: true
                                    }
                                    
                                    Text {
                                        text: model.itemValue
                                        font.pixelSize: 14
                                        color: "#e8a798"
                                        font.weight: Font.Bold
                                    }
                                }
                            }
                        }
                        ScrollIndicator.vertical: ScrollIndicator {}
                    }
                }

                // 盲盒开启提示
                Column {
                    Layout.fillWidth: true
                    spacing: 8
                    
                    Text {
                        text: "盲盒开启提示"
                        font.pixelSize: 14
                        color: "#666666"
                    }
                    TextField {
                        id: blindBoxOpenMessageInput
                        width: parent.width
                        text: "恭喜 {用户名} 开启了{盲盒名}！"
                        placeholderText: "请输入盲盒开启提示"
                        font.pixelSize: 14
                        
                        background: Rectangle {
                            radius: 6
                            color: "#fcfcfc"
                            border.width: 1
                            border.color: parent.activeFocus ? "#e8a798" : "#e0e0e0"
                        }
                    }
                }

                // 保存按钮
                Button {
                    text: "保存设置"
                    Layout.preferredWidth: 120
                    font.pixelSize: 14
                    
                    background: Rectangle {
                        color: parent.pressed ? "#d89788" : (parent.hovered ? "#e19590" : "#e8a798")
                        radius: 6
                    }
                    
                    onClicked: {
                        console.log("盲盒统计设置已保存")
                    }
                }
            }
        }
    }
}
