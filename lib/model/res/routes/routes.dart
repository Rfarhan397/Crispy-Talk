
import 'package:crispytalk/model/res/routes/routes_name.dart';
import 'package:crispytalk/provider/mediaSelection/uploadMedia.dart';
import 'package:crispytalk/screens/chat/createGroup/createGroup.dart';
import 'package:crispytalk/screens/follow/followersScreen.dart';
import 'package:crispytalk/screens/follow/followingScreen.dart';
import 'package:crispytalk/screens/login/codeScreen.dart';
import 'package:crispytalk/screens/login/forgetScreen.dart';
import 'package:crispytalk/screens/myProfile/editProfile.dart';
import 'package:crispytalk/screens/setting/accounts/accountsScreen.dart';
import 'package:crispytalk/screens/setting/privacy/privacyScreen.dart';
import 'package:crispytalk/screens/setting/termsCondition/termAndConditions.dart';

import 'package:get/get.dart';

import '../../../screens/MediaSelection/MediaSelectionScreen.dart';
import '../../../screens/chat/EditGroup/EditGroupScreen.dart';
import '../../../screens/chat/chatListScreen.dart';
import '../../../screens/chat/chatScreen.dart';
import '../../../screens/login/NewPasswordScreen.dart';
import '../../../screens/login/loginScreen.dart';
import '../../../screens/login/signUpScreen.dart';
import '../../../screens/mainScreen/homeScreen.dart';
import '../../../screens/mainScreen/mainScreen.dart';
import '../../../screens/notifications/notificationScreen.dart';
import '../../../screens/setting/notificationSetting/notificationSettingScreen.dart';
import '../../../screens/setting/settingScreen.dart';
import '../../../screens/splash/splashScreen.dart';
import '../../../screens/myProfile/userProfile.dart';
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
    GetPage(name: RoutesName.chatListScreen, page: () => ChatListScreen()),
    GetPage(name: RoutesName.chatScreen, page: () => ChatScreen()),
    GetPage(name: RoutesName.createGroup, page: () => CreateGroup()),
    GetPage(name: RoutesName.editGroup, page: () => EditGroupScreen()),
    GetPage(name: RoutesName.editProfile, page: () => EditProfile()),
    GetPage(name: RoutesName.uploadContentScreen, page: () => MediaSelectionScreenWrapper()),
    GetPage(name: RoutesName.followerScreen, page: () => FollowersScreen()),
    GetPage(name: RoutesName.followingScreen, page: () => FollowingScreen()),
    GetPage(name: RoutesName.uploadMedia, page: () => UploadMediaScreen()),

  ];
}
