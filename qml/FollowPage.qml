import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import BilibiliBot 1.0

Page {
    title: "关注答谢设置"

    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width

        Item { // Use an Item for padding
            width: Math.min(parent.width, 640)
            anchors.horizontalCenter: parent.horizontalCenter
            implicitHeight: followLayout.implicitHeight + 40

            GridLayout {
                id: followLayout
                columns: 1
                width: parent.width - 40
                anchors.centerIn: parent
                rowSpacing: 15
                columnSpacing: 15

                Label {
                    text: "关注答谢设置"
                    font.pixelSize: 20
                    font.bold: true
                    Layout.fillWidth: true
                    Layout.bottomMargin: 10
                    horizontalAlignment: Text.AlignHCenter
                }
                Label {
                    text: "设置新粉丝关注时的答谢词"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.fillWidth: true
                    Layout.bottomMargin: 20
                    horizontalAlignment: Text.AlignHCenter
                }

                RowLayout {
                    Layout.fillWidth: true
                    Switch {
                        id: enableFollowThanksToggle
                        text: "启用关注答谢功能"
                        checked: true
                    }
                }

                Label {
                    text: "关注答谢词"
                    font.pixelSize: 14
                    color: "gray"
                }
                TextField {
                    id: followThanksMessageInput
                    Layout.fillWidth: true
                    text: "感谢 {用户名} 的关注，欢迎加入我们！"
                }

                Label {
                    text: "答谢延迟 (秒)"
                    font.pixelSize: 14
                    color: "gray"
                }
                SpinBox {
                    id: followThanksDelaySpinBox
                    Layout.fillWidth: true
                    from: 0
                    to: 5
                    value: 2
                    editable: true
                }

                Label {
                    text: "特别关注用户答谢"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.topMargin: 15
                }
                TextField {
                    id: specialFollowUserInput
                    Layout.fillWidth: true
                    placeholderText: "输入用户名..."
                }
                TextField {
                    id: specialFollowMessageInput
                    Layout.fillWidth: true
                    placeholderText: "自定义答谢词..."
                    Layout.topMargin: 5
                }
                Button {
                    id: addSpecialFollowUserButton
                    text: "添加用户"
                    Layout.fillWidth: true
                    Layout.topMargin: 10
                    // Add style to mimic btn-outline if desired, or use default Button style
                    onClicked: {
                        // Placeholder for add user action
                        console.log("添加特别关注用户: " + specialFollowUserInput.text + ", 答谢词: " + specialFollowMessageInput.text);
                        specialFollowUserListModel.append({userName: specialFollowUserInput.text, customMessage: specialFollowMessageInput.text});
                        specialFollowUserInput.clear();
                        specialFollowMessageInput.clear();
                    }
                }

                Label {
                    text: "已设置的特殊关注用户"
                    font.pixelSize: 14
                    color: "gray"
                    Layout.topMargin: 15
                }
                ListView {
                    id: specialFollowUserListView
                    Layout.fillWidth: true
                    Layout.preferredHeight: 150 // Adjust as needed, similar to max-height: 200px
                    clip: true
                    model: ListModel {
                        id: specialFollowUserListModel
                        ListElement { userName: "超级粉丝007"; customMessage: "特别感谢超级粉丝007的关注！" }
                        ListElement { userName: "舰长小明"; customMessage: "欢迎舰长小明！" }
                        ListElement { userName: "老铁一号"; customMessage: "感谢老铁一号！" }
                    }
                    delegate: ItemDelegate {
                        width: parent.width
                        text: model.userName // Changed to model.userName

                        RowLayout {
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 10
                            Button {
                                text: "删除"
                                flat: true // For a less prominent look
                                onClicked: {
                                    specialFollowUserListModel.remove(index); // Use index directly
                                }
                            }
                        }
                    }
                    ScrollIndicator.vertical: ScrollIndicator {}
                }

                Button {
                    id: saveFollowSettingsButton
                    text: "保存设置"
                    Layout.fillWidth: true
                    Layout.topMargin: 20
                    highlighted: true
                    onClicked: {
                        // Placeholder for save action
                        console.log("关注答谢设置已保存");
                    }
                }
            }
        }
    }
}
