cmake_minimum_required(VERSION 3.16)
project(BilibiliBot VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable Qt MOC, RCC and UIC
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Set Qt policy for QML modules
if(POLICY CMP0071)
    cmake_policy(SET CMP0071 NEW)
endif()

find_package(Qt6 REQUIRED COMPONENTS Core Quick QuickControls2 Widgets Core5Compat)

# Set Qt policy for QML resource prefix
qt_policy(SET QTP0001 NEW)
qt_policy(SET QTP0004 NEW)

qt_add_executable(bilibilibot-gui
    src/main.cpp
)

qt_add_qml_module(bilibilibot-gui
    URI BilibiliBot
    VERSION 1.0
    QML_FILES
        qml/main.qml
        qml/LoginPage.qml
        qml/MainPage.qml
        qml/Sidebar.qml
        qml/DanmakuPage.qml
        qml/StatsPage.qml
        qml/WelcomePage.qml
        qml/GiftPage.qml
        qml/FollowPage.qml
        qml/SharePage.qml
        qml/BlindboxPage.qml
        qml/PKPage.qml
        qml/SettingsPage.qml
        qml/components/DanmakuMessage.qml
        qml/components/StatsCard.qml
        qml/components/ToggleSwitch.qml
    SOURCES
        src/DanmakuModel.h
        src/DanmakuModel.cpp
        src/SettingsManager.h
        src/SettingsManager.cpp
        src/BilibiliApi.h
        src/BilibiliApi.cpp
        src/TTSManager.h
        src/TTSManager.cpp
)

target_link_libraries(bilibilibot-gui PRIVATE
    Qt6::Core
    Qt6::Quick
    Qt6::QuickControls2
    Qt6::Widgets
    Qt6::Core5Compat
)

# Include directories for headers
target_include_directories(bilibilibot-gui PRIVATE src)

# 设置应用图标和名称
set_target_properties(bilibilibot-gui PROPERTIES
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE TRUE
    MACOSX_BUNDLE_GUI_IDENTIFIER com.bilibilibot.app
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
)
