import 'package:crispytalk/constant.dart';
import 'package:crispytalk/model/res/components/app_button_widget.dart';
import 'package:crispytalk/model/res/constant/app_assets.dart';
import 'package:crispytalk/model/res/constant/app_colors.dart';
import 'package:crispytalk/model/res/constant/app_icons.dart';
import 'package:crispytalk/model/res/routes/routes_name.dart';
import 'package:crispytalk/model/res/widgets/app_text.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../model/res/widgets/customDialog.dart';
class UserProfile extends StatelessWidget {
   UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          PopupMenuButton<String>(
            icon: SvgPicture.asset(AppIcons.menu),
            onSelected: (value) {
              if (value == 'Block') {
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return const CustomDialog(
                        content:  'Are you sure you want to Block?',
                        cancel: "Cancel",
                        yes: "Block",
                      );
                    });
                print('Block selected');
              } else if (value == 'Report') {
                print('Report selected');
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return const CustomDialog(
                        content: 'Why you report this user? Write a short Description',
                        title:  'Report User?',
                        cancel: "Cancel",
                        yes: "Submit",
                        showTextField: true,
                        hintText: 'Write the Description',
                        showtitle: true,
                      );
                    });
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Block',
                  child: Text('Block', style: TextStyle(color: Colors.black)),
                ),
                const PopupMenuItem<String>(
                  value: 'Report',
                  child: Text('Report', style: TextStyle(color: Colors.black)),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Background Image
            SizedBox(
              height: 60.w,
              width: 100.w,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  AppAssets.userBg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -10.h),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(56),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(56),
                      child: Image.asset(
                        AppAssets.lady,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 34,
                      width: 34,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(AppIcons.camera),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, -8.h),
              child: Column(
                children: [
                  const AppTextWidget(
                    text: 'Mian Uzair',
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                    fontSize: 18,
                  ),
                  const AppTextWidget(
                    text: 'I am delighted to introduce myself\nI am a professional Model',
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGrey,
                    fontSize: 12,
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildFollow("567k", "Followers",() {
                            Get.toNamed(RoutesName.followerScreen);
                          },),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: VerticalDivider(
                              width: 20,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          buildFollow("1234", "Following",() {
                          Get.toNamed(RoutesName.followingScreen);
                          },),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: VerticalDivider(
                              width: 20,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          buildFollow("456k", "Likes",() {
                            Get.toNamed(RoutesName.followingScreen);
                          },),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButtonWidget(
                        prefixIcon: SvgPicture.asset(AppIcons.editProfile),
                        onPressed: () {
                          Get.toNamed(RoutesName.editProfile);
                        },
                        radius: 12,
                        fontSize: 12,
                        width: 30.w,
                        text: 'Edit Profile',
                      ),
                      SizedBox(width: 5.w),
                      AppButtonWidget(
                        prefixIcon: SvgPicture.asset(AppIcons.shareProfile),
                        onPressed: () {},
                        radius: 12,
                        fontSize: 12,
                        width: 30.w,
                        text: 'Share Profile',
                      ),
                    ],
                  ),
                  DefaultTabController(
                    length: 2,
                    child: SizedBox(
                      width: 50.w,
                      child: const TabBar(
                        dividerColor: Colors.transparent,
                        indicatorColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                        tabs: [
                          Tab(
                            icon: Icon(
                              Icons.grid_view,
                              color: Colors.black,
                            ),
                          ),
                          Tab(
                            icon: Icon(
                              Icons.bookmark_border,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -8.h),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10, // Number of items to display
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.88,
                        ),
                        itemBuilder: (context, index) {
                          return ImageCard(
                            imageUrl: AppAssets.lady,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFollow(String title, String subtitle,VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AppTextWidget(
            text: title,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          AppTextWidget(
            text: subtitle,
            fontSize: 14,
            color: AppColors.textGrey,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imageUrl;

  const ImageCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 1.h,
              left: 3.w,
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.notLike, height: 18),
                  SizedBox(width: 1.w),
                  AppTextWidget(
                    text: '10K',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



