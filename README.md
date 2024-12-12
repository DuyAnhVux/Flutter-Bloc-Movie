# generate code

flutter pub run build_runner build

flutter pub run build_runner build --delete-conflicting-outputs

export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_HOME=/Users/bimbi/Library/Android/sdk
export ANDROID_SDK_ROOT=/Users/bimbi/Library/Android/sdk

export PATH="$PATH:$HOME/flutter/bin"
flutter build apk --split-per-abi

dart pub global activate flutterfire_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"
flutterfire configure

-----Sửa tên app
flutter pub run flutter_app_name
------Sua package App
flutter pub run change_app_package_name:main com.doapp.store.sy
-----Tạo icon
flutter pub run flutter_launcher_icons:main
-----Xoá git
Rm -rf .git

BBe9228171dA87A51d2896e4210382Aa7f430B5d /// token Giao hang tiet kiem Hieudeptrai

Thẻ test:
Ngân hàng NCB
Số thẻ 9704198526191432198
Tên chủ thẻ NGUYEN VAN A
Ngày phát hành 07/15
Mật khẩu OTP 123456

flutter pub outdated --mode=null-safety

Create a keystore (key.jks in folder terminal)
keytool -genkey -v -keystore key.jks -alias <alias_name> -keyalg RSA -keysize 2048 -validity 20000

/////////////////////////////////////////////
<app dir>/android/key.properties

storePassword=123456
keyPassword=123456
keyAlias=alias_name
storeFile=../../key.jks
/////////////////////////////////////////////

flutter build appbundle

flutter build apk --split-per-abi
