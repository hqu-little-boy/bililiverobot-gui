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
            text: "分享感谢设置"
            font.pixelSize: 24
            font.weight: Font.Medium
            color: "#333333"
        }
        
        // 分享设置卡片
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 600
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
                        text: "🔗"
                        font.pixelSize: 18
                    }
                    Text {
                        text: "设置直播间分享后的感谢词"
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
                        id: enableShareThanksToggle
                        checked: true
                    }
                    Text {
                        text: "启用分享感谢功能"
                        font.pixelSize: 14
                        color: "#333333"
                    }
                }

                // 分享感谢词
                Column {
                    Layout.fillWidth: true
                    spacing: 8
                    
                    Text {
                        text: "分享感谢词"
                        font.pixelSize: 14
                        color: "#666666"
                    }
                    TextField {
                        id: shareThanksMessageInput
                        width: parent.width
                        text: "感谢 {用户名} 分享直播间！"
                        placeholderText: "请输入分享感谢词"
                        font.pixelSize: 14
                        
                        background: Rectangle {
                            radius: 6
                            color: "#fcfcfc"
                            border.width: 1
                            border.color: parent.activeFocus ? "#e8a798" : "#e0e0e0"
                        }
                    }
                }

                // 分享平台识别
                Column {
                    Layout.fillWidth: true
                    spacing: 8
                    
                    Text {
                        text: "分享平台识别"
                        font.pixelSize: 14
                        color: "#666666"
                    }
                    GridLayout {
                        Layout.fillWidth: true
                        columns: 2
                        rowSpacing: 10
                        columnSpacing: 10

                        CheckBox {
                            text: "B站动态"
                            checked: true
                            font.pixelSize: 14
                        }
                        CheckBox {
                            text: "微信"
                            checked: true
                            font.pixelSize: 14
                        }
                        CheckBox {
                            text: "微博"
                            checked: true
                            font.pixelSize: 14
                        }
                        CheckBox {
                            text: "QQ空间"
                            checked: false
                            font.pixelSize: 14
                        }
                    }
                }

                // 分享次数阈值
                Column {
                    Layout.fillWidth: true
                    spacing: 8
                    
                    Text {
                        text: "分享次数阈值"
                        font.pixelSize: 14
                        color: "#666666"
                    }
                    SpinBox {
                        id: shareThresholdSpinBox
                        from: 1
                        to: 20
                        value: 5
                        editable: true
                        font.pixelSize: 14
                        
                        background: Rectangle {
                            radius: 6
                            color: "#fcfcfc"
                            border.width: 1
                            border.color: parent.activeFocus ? "#e8a798" : "#e0e0e0"
                        }
                    }
                    Text {
                        text: "用户分享达到此次数才触发感谢"
                        font.pixelSize: 12
                        color: "#999999"
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
                        console.log("分享感谢设置已保存")
                    }
                }
            }
        }
    }
}
