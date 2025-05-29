# B站弹幕机器人GUI应用

基于Qt6/QML开发的B站弹幕机器人图形用户界面应用程序。

## 项目状态: ✅ 编译成功并可运行

### 已完成功能

#### 🏗️ 项目架构
- ✅ 完整的CMake构建系统
- ✅ Qt6依赖配置（Core, Quick, QuickControls2, Widgets, Core5Compat）
- ✅ C++与QML集成架构
- ✅ 模块化代码组织

#### 🔧 C++后端 (4个类)
- ✅ **DanmakuModel**: 弹幕消息管理（QAbstractListModel）
- ✅ **SettingsManager**: 应用设置管理（持久化存储）
- ✅ **BilibiliApi**: B站API接口封装（模拟实现）
- ✅ **TTSManager**: 语音合成管理（队列处理）

#### 🎨 QML前端 (13个文件)
- ✅ **主应用窗口**: login/main页面切换
- ✅ **登录页面**: 二维码登录流程模拟
- ✅ **主页面**: 侧边栏导航布局
- ✅ **9个功能页面**:
  - 弹幕页面：实时消息显示+TTS控制
  - 统计页面：数据可视化卡片
  - 欢迎页面：自定义欢迎消息
  - 礼物、关注、分享、盲盒、PK、设置页面
- ✅ **3个可复用组件**: DanmakuMessage, StatsCard, ToggleSwitch

#### 🎯 技术特性
- ✅ Material Design风格UI
- ✅ 响应式布局设计
- ✅ 属性绑定与信号槽机制
- ✅ QML模块化组件架构
- ✅ 原生Qt6效果（纯QML阴影实现）

## 构建与运行

### 系统要求
- Qt6 (包含 Core, Quick, QuickControls2, Widgets, Core5Compat)
- CMake 3.16+
- C++17编译器

### 编译命令
```bash
# 创建构建目录
mkdir build && cd build

# 配置项目
cmake ..

# 编译
make -j$(nproc)

# 运行
./bilibilibot-gui
```

### 快速测试
```bash
# 运行自动化测试脚本
./test_build.sh
```

## 项目结构

```
bilibilibot-gui/
├── CMakeLists.txt              # CMake配置文件
├── test_build.sh              # 自动化测试脚本
├── src/                       # C++源代码
│   ├── main.cpp              # 应用程序入口
│   ├── DanmakuModel.h/cpp    # 弹幕数据模型
│   ├── SettingsManager.h/cpp # 设置管理器
│   ├── BilibiliApi.h/cpp     # B站API接口
│   └── TTSManager.h/cpp      # TTS语音管理
├── qml/                      # QML界面文件
│   ├── main.qml              # 主应用窗口
│   ├── LoginPage.qml         # 登录页面
│   ├── MainPage.qml          # 主界面
│   ├── Sidebar.qml           # 侧边栏
│   ├── [功能页面].qml        # 9个功能页面
│   └── components/           # 可复用组件
└── build/                    # 构建输出目录
```

## 待完成功能

### 🔄 后续开发计划
- [ ] 实现真实的B站API集成
- [ ] 添加TTS语音引擎后端
- [ ] 实现数据持久化存储
- [ ] 添加图表可视化组件
- [ ] 完善功能页面的具体逻辑
- [ ] 添加应用图标和资源
- [ ] 优化UI响应性和动画效果

### 🧪 测试与优化
- [ ] 单元测试覆盖
- [ ] 性能优化
- [ ] 内存泄漏检查
- [ ] 跨平台兼容性测试

## 技术说明

### C++/QML集成
- 使用`qmlRegisterType`手动注册C++类型到QML
- 通过Qt属性系统实现数据绑定
- 信号槽机制处理异步事件

### 资源管理
- QML文件通过Qt资源系统打包
- 支持热重载开发模式
- 模块化组件设计便于维护

### 构建系统
- CMake管理多目标构建
- 自动QML缓存生成
- MOC元对象编译集成

## 许可证

本项目仅供学习和演示用途。

## 贡献指南

1. Fork项目
2. 创建功能分支
3. 提交更改
4. 发起Pull Request

---
*最后更新: 2025年5月29日*
