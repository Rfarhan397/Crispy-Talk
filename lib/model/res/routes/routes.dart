
import 'package:crispytalk/model/res/routes/routes_name.dart';
import 'package:crispytalk/screens/chat/createGroup/createGroup.dart';
import 'package:crispytalk/screens/login/codeScreen.dart';
import 'package:crispytalk/screens/login/forgetScreen.dart';
import 'package:crispytalk/screens/setting/accounts/accountsScreen.dart';
import 'package:crispytalk/screens/setting/privacy/privacyScreen.dart';
import 'package:crispytalk/screens/setting/termsCondition/termAndConditions.dart';

import 'package:get/get.dart';

import '../../../screens/chat/EditGroup/EditGroupScreen.dart';
import '../../../screens/chat/chatListScreen.dart';
import '../../../screens/login/NewPasswordScreen.dart';
import '../../../screens/login/loginScreen.dart';
import '../../../screens/login/signUpScreen.dart';
import '../../../screens/mainScreen/homeScreen.dart';
import '../../../screens/mainScreen/mainScreen.dart';
import '../../../screens/notifications/notificationScreen.dart';
import '../../../screens/setting/notificationSetting/notificationSettingScreen.dart';
import '../../../screens/setting/settingScreen.dart';
import '../../../screens/splash/splashScreen.dart';
import '../../../screens/video/userProfile.dart';
import '../../../screens/video/videoScreen.dart';


class Routes {
  static final routes = [
    GetPage(name: RoutesName.splashScreen, page: () => SplashScreen()),
    GetPage(name: RoutesName.loginScreen, page: () => LoginScreen()),
    GetPage(name: RoutesName.signUp, page: () => SignUpScreen()),
    GetPage(name: RoutesName.code, page: () => CodeScreen()),
    GetPage(name: RoutesName.forget, page: () => ForgetScreen()),
    GetPage(name: RoutesName.newPassword, page: () => NewPasswordScreen()),
    GetPage(name: RoutesName.mainScreen, page: () => MainScreen()),
    GetPage(name: RoutesName.homeScreen, page: () => HomeScreen()),
    GetPage(name: RoutesName.video, page: () => VideoScreen()),
    GetPage(name: RoutesName.userProfile, page: () => UserProfile()),
    GetPage(name: RoutesName.notificationScreen, page: () => NotificationScreen()),
    GetPage(name: RoutesName.settingScreen, page: () => SettingsScreen()),
    GetPage(name: RoutesName.accountScreen, page: () => AccountScreen()),
    GetPage(name: RoutesName.notificationSettingScreen, page: () => SettingNotificationScreen()),
    GetPage(name: RoutesName.privacyScreen, page: () => PrivacyScreen()),
    GetPage(name: RoutesName.termAndConditions, page: () => TermAndConditions()),
    GetPage(name: RoutesName.chatScreen, page: () => ChatListScreen()),
    GetPage(name: RoutesName.createGroup, page: () => CreateGroup()),
    GetPage(name: RoutesName.editGroup, page: () => EditGroupScreen()),

  ];
}
