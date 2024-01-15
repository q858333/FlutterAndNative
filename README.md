# FlutterAndNative
## Flutter 和 iOS交互(不使用cocoapod)，查考 https://flutter.cn/docs/add-to-app/ios/project-setup
1.使用命令行创建Flutter module，
flutter create --template module my_flutter

2.调试flutter代码
文件目录有.ios和.android文件夹可以用于调试代码，pubspec.yaml用于添加依赖库

3.在module目录生成frameworks（Flutter.framework 和 App.framework）
flutter build ios-framework

4.链接到iOS工程
选择Xcode中 build settings > Build Phases > Link Binary With Libraries，添加Flutter.framework 和 App.framework(选择 “Embed & Sign”)，
在 target 的编译设置中的 Framework Search Paths (FRAMEWORK_SEARCH_PATHS) 增加 $(PROJECT_DIR)/.../ （Flutter.framework 和 App.framework的路径）
