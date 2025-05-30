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
            text: "实时弹幕"
            font.pixelSize: 24
            font.weight: Font.Medium
            color: "#333333"
        }
        
        // 弹幕显示卡片
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 520
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
                RowLayout {
                    Layout.fillWidth: true
                    
                    Row {
                        spacing: 10
                        Text {
                            text: "💬"
                            font.pixelSize: 18
                        }
                        Text {
                            text: "直播间弹幕"
                            font.pixelSize: 18
                            font.weight: Font.Medium
                            color: "#333333"
                        }
                    }
                    
                    Item { Layout.fillWidth: true }
                    
                    // Row {
                    //     spacing: 8
                    //     Text {
                    //         text: "🔊"
                    //         font.pixelSize: 14
                    //         color: "#e8a798"
                    //     }
                    //     Text {
                    //         text: root.ttsManager ? (root.ttsManager.isEnabled ? "TTS 已启用" : "TTS 已禁用") : "TTS 已禁用"
                    //         font.pixelSize: 14
                    //         color: "#e8a798"
                    //     }
                    // }
                }
                
                Rectangle {
                    Layout.fillWidth: true
                    height: 1
                    color: "#f0f0f0"
                }
                
                // 弹幕容器
                ScrollView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    
                    ListView {
                        id: danmakuListView
                        model: DanmakuModel
                        spacing: 10
                        
                        delegate: DanmakuMessage {
                            width: danmakuListView.width
                            userName: model.user
                            messageText: model.text
                            messageTime: model.time
                            messageType: model.type
                        }
                        
                        // 当有新消息时自动滚动到顶部
                        onCountChanged: {
                            positionViewAtBeginning()
                        }
                    }
                }
                
                Rectangle {
                    Layout.fillWidth: true
                    height: 1
                    color: "#f0f0f0"
                }
                
                // 控制按钮
                RowLayout {
                    Layout.fillWidth: true
                    
                    // Button {
                    //     text: root.ttsManager ? (root.ttsManager.isPlaying ? "⏸️ 暂停播报" : "▶️ 恢复播报") : "▶️ 恢复播报"
                    //
                    //     background: Rectangle {
                    //         radius: 6
                    //         color: "#f0f0f0"
                    //         border.width: 1
                    //         border.color: "#e0e0e0"
                    //     }
                    //
                    //     contentItem: Text {
                    //         text: parent.text
                    //         font.pixelSize: 14
                    //         color: "#666666"
                    //         horizontalAlignment: Text.AlignHCenter
                    //         verticalAlignment: Text.AlignVCenter
                    //     }
                    //
                    //     onClicked: {
                    //         if (root.ttsManager) {
                    //             if (root.ttsManager.isPlaying) {
                    //                 root.ttsManager.pause()
                    //             } else {
                    //                 root.ttsManager.resume()
                    //             }
                    //         }
                    //     }
                    // }
                    
                    Item { Layout.fillWidth: true }
                    
                    // Button {
                    //     text: "🔄 清空弹幕"
                    //
                    //     background: Rectangle {
                    //         radius: 6
                    //         color: parent.pressed ? "#d89788" : "#e8a798"
                    //     }
                    //
                    //     contentItem: Text {
                    //         text: parent.text
                    //         font.pixelSize: 14
                    //         color: "#ffffff"
                    //         horizontalAlignment: Text.AlignHCenter
                    //         verticalAlignment: Text.AlignVCenter
                    //     }
                    //
                    //     onClicked: {
                    //         if (root.danmakuModel) {
                    //             root.danmakuModel.clearMessages()
                    //         }
                    //     }
                    // }
                }
            }
        }
        
        // TTS控制卡片
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 300
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
                        text: "🔊"
                        font.pixelSize: 18
                    }
                    Text {
                        text: "TTS 控制面板"
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
                
                // TTS开关
                RowLayout {
                    Layout.fillWidth: true
                    
                    ToggleSwitch {
                        checked: SettingsManager.ttsEnabled
                        onCheckedChanged: {
                            SettingsManager.ttsEnabled = checked
                        }
                    }
                    
                    Text {
                        text: "启用TTS语音播报"
                        font.pixelSize: 14
                        color: "#333333"
                    }
                }
                
                // 音量和语速控制
                GridLayout {
                    Layout.fillWidth: true
                    columns: 2
                    columnSpacing: 20
                    rowSpacing: 15
                    
                    // 音量控制
                    Column {
                        spacing: 8
                        Text {
                            text: "语音音量"
                            font.pixelSize: 14
                            color: "#666666"
                        }
                        
                        RowLayout {
                            spacing: 10
                            Slider {
                                id: volumeSlider
                                Layout.preferredWidth: 120
                                from: 0
                                to: 100
                                value: root.settingsManager ? (root.settingsManager.ttsVolume || 80) : 80
                                
                                onValueChanged: {
                                    if (root.settingsManager) {
                                        root.settingsManager.ttsVolume = value
                                    }
                                }
                            }
                            
                            Text {
                                text: Math.round(volumeSlider.value) + "%"
                                font.pixelSize: 12
                                color: "#666666"
                                Layout.preferredWidth: 30
                            }
                        }
                    }
                    
                    // 语速控制
                    Column {
                        spacing: 8
                        Text {
                            text: "语速"
                            font.pixelSize: 14
                            color: "#666666"
                        }
                        
                        RowLayout {
                            spacing: 10
                            Slider {
                                id: speedSlider
                                Layout.preferredWidth: 120
                                from: 1
                                to: 10
                                value: root.settingsManager ? (root.settingsManager.ttsSpeed || 5) : 5
                                
                                onValueChanged: {
                                    if (root.settingsManager) {
                                        root.settingsManager.ttsSpeed = value
                                    }
                                }
                            }
                            
                            Text {
                                text: Math.round(speedSlider.value)
                                font.pixelSize: 12
                                color: "#666666"
                                Layout.preferredWidth: 30
                            }
                        }
                    }
                }
                
                // // 语音风格选择
                // Column {
                //     Layout.fillWidth: true
                //     spacing: 8
                //
                //     Text {
                //         text: "语音风格"
                //         font.pixelSize: 14
                //         color: "#666666"
                //     }
                //
                //     ComboBox {
                //         Layout.fillWidth: true
                //         model: root.ttsManager ? (root.ttsManager.availableVoices || ["温柔女声", "活泼女声", "成熟男声"]) : ["温柔女声", "活泼女声", "成熟男声"]
                //         currentIndex: {
                //             if (root.ttsManager && root.ttsManager.availableVoices) {
                //                 return root.ttsManager.availableVoices.indexOf(root.settingsManager ? (root.settingsManager.ttsVoice || "温柔女声") : "温柔女声")
                //             }
                //             return 0
                //         }
                //
                //         onCurrentTextChanged: {
                //             if (root.settingsManager) {
                //                 root.settingsManager.ttsVoice = currentText
                //             }
                //         }
                //
                //         background: Rectangle {
                //             radius: 6
                //             color: "#fcfcfc"
                //             border.width: 1
                //             border.color: "#e0e0e0"
                //         }
                //     }
                // }
                //
                // // 测试按钮
                // Button {
                //     Layout.alignment: Qt.AlignLeft
                //     text: "🎵 测试语音"
                //
                //     background: Rectangle {
                //         radius: 6
                //         color: parent.pressed ? "#d89788" : "#e8a798"
                //     }
                //
                //     contentItem: Text {
                //         text: parent.text
                //         font.pixelSize: 14
                //         color: "#ffffff"
                //         horizontalAlignment: Text.AlignHCenter
                //         verticalAlignment: Text.AlignVCenter
                //     }
                //
                //     onClicked: {
                //         if (root.ttsManager) {
                //             root.ttsManager.testSpeak()
                //         }
                //     }
                // }
            }
        }
    }
}
