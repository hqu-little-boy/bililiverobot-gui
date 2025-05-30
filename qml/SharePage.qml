import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BilibiliBot 1.0

Page {
    title: "分享感谢设置"

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width

        Item { // Use an Item for padding
            width: Math.min(parent.width, 640)
            anchors.horizontalCenter: parent.horizontalCenter
            implicitHeight: shareLayout.implicitHeight + 40

            GridLayout {
                id: shareLayout
                columns: 1
                width: parent.width - 40
                anchors.centerIn: parent
                rowSpacing: 15
                columnSpacing: 15

                Label {
                    text: "分享感谢设置"
                    font.pixelSize: 20
                    font.bold: true
                    Layout.fillWidth: true
                    Layout.bottomMargin: 10
                    horizontalAlignment: Text.AlignHCenter
                }
                Label {
                    text: "设置直播间分享后的感谢词"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.fillWidth: true
                    Layout.bottomMargin: 20
                    horizontalAlignment: Text.AlignHCenter
                }

                RowLayout {
                    Layout.fillWidth: true
                    Switch {
                        id: enableShareThanksToggle
                        text: "启用分享感谢功能"
                        checked: true
                    }
                }

                Label {
                    text: "分享感谢词"
                    font.pixelSize: 14
                    color: "gray"
                }
                TextField {
                    id: shareThanksMessageInput
                    Layout.fillWidth: true
                    text: "感谢 {用户名} 分享直播间！"
                }

                Label {
                    text: "分享平台识别"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.topMargin: 15
                }
                GridLayout {
                    Layout.fillWidth: true
                    columns: 2
                    rowSpacing: 10
                    columnSpacing: 10

                    CheckBox {
                        text: "B站动态"
                        checked: true
                    }
                    CheckBox {
                        text: "微信"
                        checked: true
                    }
                    CheckBox {
                        text: "微博"
                        checked: true
                    }
                    CheckBox {
                        text: "QQ空间"
                        checked: false
                    }
                }

                Label {
                    text: "分享次数阈值"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.topMargin: 15
                }
                SpinBox {
                    id: shareThresholdSpinBox
                    Layout.fillWidth: true
                    from: 1
                    to: 20
                    value: 5
                    editable: true
                }
                Label {
                    text: "用户分享达到此次数才触发感谢"
                    font.pixelSize: 12
                    color: "darkgray"
                    Layout.fillWidth: true
                }

                Button {
                    id: saveShareSettingsButton
                    text: "保存设置"
                    Layout.fillWidth: true
                    Layout.topMargin: 20
                    highlighted: true
                    onClicked: {
                        // Placeholder for save action
                        console.log("分享感谢设置已保存");
                    }
                }
            }
        }
    }
}
