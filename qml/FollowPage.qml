import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

ScrollView {
    id: root
    
    property var danmakuModel
    property var settingsManager
    property var bilibiliApi
    property var ttsManager
    
    ColumnLayout {
        width: root.width
        spacing: 20
        
        Text {
            text: "关注答谢设置"
            font.pixelSize: 24
            font.weight: Font.Medium
            color: "#333333"
        }
        
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 400
            radius: 8
            color: "#ffffff"
            
            DropShadow {
                anchors.fill: parent
                horizontalOffset: 0
                verticalOffset: 2
                radius: 10
                samples: 21
                color: "#10000000"
                source: parent
            }
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 25
                
                Row {
                    spacing: 10
                    Text {
                        text: "👥"
                        font.pixelSize: 18
                    }
                    Text {
                        text: "关注答谢设置"
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
                
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    radius: 6
                    color: "#f9f9f9"
                    border.width: 1
                    border.color: "#e0e0e0"
                    
                    Text {
                        anchors.centerIn: parent
                        text: "👥 关注答谢功能设置区域\n（待实现具体功能）"
                        font.pixelSize: 14
                        color: "#999999"
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }
    }
}
