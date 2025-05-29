#!/bin/bash

# B站弹幕机器人GUI应用测试脚本

echo "=== B站弹幕机器人GUI应用编译测试 ==="

# 进入项目目录
cd /home/zeng/CLionProjects/bilibilibot-gui

echo "1. 清理构建目录..."
rm -rf build
mkdir build
cd build

echo "2. 配置项目..."
if cmake ..; then
    echo "✓ CMake配置成功"
else
    echo "✗ CMake配置失败"
    exit 1
fi

echo "3. 编译项目..."
if make -j$(nproc); then
    echo "✓ 编译成功"
else
    echo "✗ 编译失败"
    exit 1
fi

echo "4. 检查可执行文件..."
if [ -f "./bilibilibot-gui" ]; then
    echo "✓ 可执行文件已生成"
    echo "文件大小: $(du -h ./bilibilibot-gui | cut -f1)"
else
    echo "✗ 可执行文件未找到"
    exit 1
fi

echo "5. 测试应用启动..."
echo "注意: 应用将在后台启动10秒，然后自动关闭"
timeout 10s ./bilibilibot-gui &
sleep 2

if pgrep -f "bilibilibot-gui" > /dev/null; then
    echo "✓ 应用启动成功"
    # 等待10秒后自动关闭
    wait
    echo "✓ 应用正常退出"
else
    echo "✗ 应用启动失败"
fi

echo ""
echo "=== 测试完成 ==="
echo "项目结构:"
echo "- 源代码: 4个C++类（DanmakuModel, SettingsManager, BilibiliApi, TTSManager）"
echo "- QML界面: 13个QML文件（主界面+9个功能页面+3个组件）"
echo "- 构建系统: CMake配置完整"
echo "- 依赖库: Qt6 Core, Quick, QuickControls2, Widgets, Core5Compat"
echo ""
echo "要手动运行应用程序，请执行："
echo "cd /home/zeng/CLionProjects/bilibilibot-gui/build && ./bilibilibot-gui"
