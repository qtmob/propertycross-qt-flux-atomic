QT += core gui qml quick quickcontrols2

TEMPLATE = app

TARGET = propertycross-qt-flux-atomic

SOURCES += main.cpp

RESOURCES += \
    qml.qrc \
    ui/ui.qrc \
    logic/logic.qrc

include(vendor/vendor.pri)

android {
    DISTFILES += \
        android/AndroidManifest.xml \
        android/gradle/wrapper/gradle-wrapper.jar \
        android/gradlew \
        android/res/values/libs.xml \
        android/build.gradle \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradlew.bat

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
}

ios {
    QMAKE_IOS_DEPLOYMENT_TARGET = 8.0
    QMAKE_INFO_PLIST = ios/Info.plist
    DISTFILES += \
        ios/Info.plist
    ios_icon.files = $$files($$PWD/ios/Icon-App-*.png)
    QMAKE_BUNDLE_DATA += ios_icon
}
