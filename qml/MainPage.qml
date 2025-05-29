import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "."

Rectangle {
    id: root
    color: "#f8f5f2"
    
    property var danmakuModel
    property var settingsManager
    property var bilibiliApi
    property var ttsManager
    
    RowLayout {
        anchors.fill: parent
        spacing: 0
        
        // 侧边栏
        Sidebar {
            id: sidebar
            Layout.preferredWidth: 70
            Layout.fillHeight: true
            
            onPageChanged: function(page) {
                contentLoader.source = page + "Page.qml"
            }
        }
        
        // 主内容区域
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"
            
            Loader {
                id: contentLoader
                anchors.fill: parent
                anchors.margins: 20
                source: "DanmakuPage.qml"
                
                onLoaded: {
                    if (item) {
                        // 传递管理器实例给加载的页面
                        if (item.hasOwnProperty("danmakuModel"))
                            item.danmakuModel = root.danmakuModel
                        if (item.hasOwnProperty("settingsManager"))
                            item.settingsManager = root.settingsManager
                        if (item.hasOwnProperty("bilibiliApi"))
                            item.bilibiliApi = root.bilibiliApi
                        if (item.hasOwnProperty("ttsManager"))
                            item.ttsManager = root.ttsManager
                    }
                }
            }
        }
    }
}
