import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BilibiliBot 1.0

Page {
    title: "礼物答谢设置"

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width

        Item { // Use an Item for padding
            width: Math.min(parent.width, 640) // Max width for content + padding
            anchors.horizontalCenter: parent.horizontalCenter
            implicitHeight: giftLayout.implicitHeight + 40 // Add padding to height

            GridLayout {
                id: giftLayout
                columns: 1
                width: parent.width - 40 // Subtract padding from width
                anchors.centerIn: parent
                rowSpacing: 15 // Adjusted from 'spacing'
                columnSpacing: 15 // Adjusted from 'spacing'

                // Section Title (Mimicking .card-header from HTML)
                Label {
                    text: "礼物答谢设置"
                    font.pixelSize: 20
                    font.bold: true
                    Layout.fillWidth: true
                    Layout.bottomMargin: 10
                    horizontalAlignment: Text.AlignHCenter
                }

                Label {
                    text: "自定义礼物答谢词和延迟设置"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.fillWidth: true
                    Layout.bottomMargin: 20
                    horizontalAlignment: Text.AlignHCenter
                }

                // Enable/Disable Toggle
                RowLayout {
                    Layout.fillWidth: true
                    Switch {
                        id: enableGiftThanksToggle
                        text: "启用礼物答谢功能"
                        checked: true // Default to checked as in HTML
                    }
                }

                // Gift Thanks Delay
                Label {
                    text: "礼物答谢延迟 (秒)"
                    font.pixelSize: 14
                    color: "gray"
                }
                SpinBox {
                    id: giftThanksDelaySpinBox
                    Layout.fillWidth: true
                    from: 0
                    to: 10
                    value: 3
                    editable: true
                }

                // Default Thanks Message
                Label {
                    text: "默认答谢词"
                    font.pixelSize: 14
                    color: "gray"
                }
                TextField {
                    id: defaultThanksMessageInput
                    Layout.fillWidth: true
                    placeholderText: "输入默认答谢词..."
                    text: "感谢 {用户名} 赠送的 {礼物名}！"
                }

                // High-Value Gift Settings
                Label {
                    text: "高价值礼物单独设置"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.topMargin: 15
                }
                ComboBox {
                    id: highValueGiftSelect
                    Layout.fillWidth: true
                    model: ["选择礼物类型", "大航海", "醒目留言", "节奏风暴"]
                    currentIndex: 0
                }
                TextField {
                    id: highValueGiftMessageInput
                    Layout.fillWidth: true
                    placeholderText: "自定义答谢词..."
                    text: "感谢 {用户名} 开通舰长！"
                    Layout.topMargin: 5
                }

                // Gift Value Threshold
                Label {
                    text: "礼物价值阈值"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.topMargin: 15
                }
                RowLayout {
                    Layout.fillWidth: true
                    Slider {
                        id: giftValueThresholdSlider
                        Layout.fillWidth: true
                        from: 0
                        to: 100
                        value: 50
                        stepSize: 1
                    }
                    Label {
                        text: giftValueThresholdSlider.value + " 电池"
                        font.pixelSize: 14
                    }
                }

                // Save Button
                Button {
                    id: saveGiftSettingsButton
                    text: "保存设置"
                    Layout.fillWidth: true
                    Layout.topMargin: 20
                    highlighted: true // To give it a primary action look
                    onClicked: {
                        // Placeholder for save action
                        console.log("礼物答谢设置已保存");
                        console.log("启用: " + enableGiftThanksToggle.checked);
                        console.log("延迟: " + giftThanksDelaySpinBox.value);
                        console.log("默认答谢词: " + defaultThanksMessageInput.text);
                        console.log("高价值礼物类型: " + highValueGiftSelect.displayText);
                        console.log("高价值礼物答谢词: " + highValueGiftMessageInput.text);
                        console.log("价值阈值: " + giftValueThresholdSlider.value);
                    }
                }
            }
        }
    }
}
