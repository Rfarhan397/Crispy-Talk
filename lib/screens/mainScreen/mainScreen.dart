import 'package:crispytalk/constant.dart';
import 'package:crispytalk/model/res/constant/app_assets.dart';
import 'package:crispytalk/model/res/routes/routes_name.dart';
import 'package:crispytalk/screens/chat/chatListScreen.dart';
import 'package:crispytalk/screens/mainScreen/homeScreen.dart';
import 'package:crispytalk/screens/video/videoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../model/res/components/customNavBar.dart';
import '../../model/res/constant/app_icons.dart';
import '../../provider/bottomNavBar/bottomNavBarProvider.dart';
import '../myProfile/userProfile.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavBarProvider>(
        builder: (context, value, child) {
          return IndexedStack(
            index: value.currentIndex,
            children: [
             const HomeScreen(),
             const VideoScreen(),
             ChatListScreen(),
              UserProfile(),
            ],
          );
        },),
      bottomNavigationBar: const CustomBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        heroTag: "Home",
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          Get.toNamed(RoutesName.uploadContentScreen);
        },
        backgroundColor: primaryColor,
        child: Consumer<BottomNavBarProvider>(
          builder: (context, value, child) {
            return  SvgPicture.asset(
              AppIcons.add,
              height: 80,
            );
          },),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
    );
  }
}
