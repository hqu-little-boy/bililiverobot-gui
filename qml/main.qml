import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import BilibiliBot 1.0

ApplicationWindow {
    id: window
    width: 1200
    height: 800
    minimumWidth: 800
    minimumHeight: 600
    visible: true
    title: qsTr("B站弹幕机器人")
    
    property bool isLoggedIn: false
    
    // 创建管理器实例
    DanmakuModel {
        id: danmakuModel
    }
    
    SettingsManager {
        id: settingsManager
    }
    
    BilibiliApi {
        id: bilibiliApi
        
        onLoginSuccess: {
            window.isLoggedIn = true
            danmakuModel.startSimulation()
        }
        
        onLoginStatusChanged: {
            window.isLoggedIn = bilibiliApi.isLoggedIn
        }
        
        onDanmakuReceived: function(user, message, type) {
            danmakuModel.addMessage(user, message, type)
            if (settingsManager.ttsEnabled) {
                ttsManager.speak(user + "说：" + message)
            }
        }
    }
    
    TTSManager {
        id: ttsManager
        isEnabled: settingsManager.ttsEnabled
        volume: settingsManager.ttsVolume
        speed: settingsManager.ttsSpeed
        voice: settingsManager.ttsVoice
    }
    
    // 主内容
    Loader {
        id: mainLoader
        anchors.fill: parent
        source: window.isLoggedIn ? "MainPage.qml" : "LoginPage.qml"
        
        onLoaded: {
            if (item && window.isLoggedIn) {
                item.danmakuModel = danmakuModel
                item.settingsManager = settingsManager
                item.bilibiliApi = bilibiliApi
                item.ttsManager = ttsManager
            } else if (item && !window.isLoggedIn) {
                item.bilibiliApi = bilibiliApi
            }
        }
    }
}
