import 'dart:developer';
import 'package:crispytalk/constant.dart';
import 'package:crispytalk/model/res/components/app_back_button.dart';
import 'package:crispytalk/model/res/components/app_button_widget.dart';
import 'package:crispytalk/model/res/constant/app_assets.dart';
import 'package:crispytalk/model/res/constant/app_colors.dart';
import 'package:crispytalk/model/res/constant/app_icons.dart';
import 'package:crispytalk/model/res/routes/routes_name.dart';
import 'package:crispytalk/model/res/widgets/app_text.dart.dart';
import 'package:crispytalk/provider/action/action_provider.dart';
import 'package:crispytalk/screens/video/videoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../provider/user_provider/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuProvider =
        Provider.of<ActionProvider>(context); // Access provider

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: AppTextWidget(
          text: 'Crispytalk',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: primaryColor,
          shadows: [
            Shadow(
              offset: const Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Colors.black.withOpacity(0.6),
            ),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              child: SvgPicture.asset(AppIcons.search)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: PopupMenuButton<String>(
              color: primaryColor,
              icon: SvgPicture.asset(AppIcons.menu),
              onSelected: (value) {
                menuProvider.setSelectedItem(value);

                // Handle the navigation after selection
                if (value == 'Setting') {
                  log('Setting selected');
                  Get.toNamed(RoutesName.settingScreen);
                } else if (value == 'Notification') {
                  log('Notification selected');
                  Get.toNamed(RoutesName.notificationScreen);
                } else if (value == 'Log Out') {
                  Get.toNamed(RoutesName.loginScreen);

                  log('Log Out selected');
                  // onTap here
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  buildMenuItem(
                      context, 'Setting', AppIcons.setting, menuProvider),
                  buildMenuItem(context, 'Notification', AppIcons.notification,
                      menuProvider),
                  buildMenuItem(
                      context, 'Log Out', AppIcons.exit, menuProvider),
                ];
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10, // Number of items in the list
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 3.w),
                      child: buildPhotoCard(
                        AppAssets.lady,
                        AppAssets.boy,
                        'Samia Ali',
                        () {
                          Get.toNamed(RoutesName.video);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: const AppTextWidget(
                  text: 'Suggested for you',
                  color: primaryColor,
                  fontSize: 18,
                ),
              ),
              Container(
                height: 160,
                color: const Color(0xffD9D9D9),
                child: Stack(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return buildSuggestion(
                          AppAssets.lady,
                          "Wania Khan",
                          "info@gmail.com",
                        );
                      },
                    ),
                    Positioned(
                      top: 3,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.close, color: primaryColor, size: 20),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 10, // Number of items in the list
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(right: 3.w),
                      child: buildPostContainer(AppAssets.boy, 'Cusinolgy',
                          'Enjoy with friends on holiday', () {
                        Get.toNamed(RoutesName.video);
                        // Get.toNamed(RoutesName.video);
                      }, AppAssets.lady, '4.1K', '206'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build a menu item with consistent styling
  PopupMenuItem<String> buildMenuItem(
    BuildContext context,
    String value,
    String icon,
    ActionProvider menuProvider,
  ) {
    return PopupMenuItem<String>(
      value: value,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: menuProvider.selectedItem == value
              ? const Color(0xffEDFE19)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: menuProvider.selectedItem == value
                  ? Colors.black
                  : Colors.white,
            ),
            SizedBox(width: 2.w),
            Text(
              value,
              style: TextStyle(
                color: menuProvider.selectedItem == value
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build photo card widget
  Widget buildPhotoCard(
    String profileImage,
    String storyImage,
    String userName,
      VoidCallback onTap,
  ) {
    return GestureDetector(
     onTap: onTap,

      child: Container(
        width: 36.w,
        height: 25.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                profileImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),

            // Foreground content on top of the image
            Padding(
              padding: EdgeInsets.all(2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile picture and name
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(storyImage),
                      ),
                      SizedBox(width: 2.w),
                      AppTextWidget(
                        text: userName,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPostContainer(
    String profileImage,
    String userName,
    String caption,
    VoidCallback onTap,
    String video,
    String likes,
    String comments,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info (Profile Image, Name, Caption)
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(profileImage),
              ),
              SizedBox(width: 2.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextWidget(
                    text: userName,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 0.5.h),
          AppTextWidget(
            text: caption,
            color: Colors.grey,
            fontSize: 10,
          ),
          SizedBox(height: 1.h),
          Stack(
            children: [
              // Post Image
              ClipRRect(
                child: GestureDetector(
                  onTap: onTap,
                  child: Image.asset(
                    video,
                    width: double.infinity,
                    height: 30.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const Positioned.fill(
                child: Center(
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 80,
                  ),
                ),
              ),

              Positioned(
                bottom: 10,
                left: 10,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.notLike,
                      height: 15,
                    ),
                    SizedBox(width: 1.w),
                    AppTextWidget(
                      text: likes,
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    SizedBox(width: 3.w),
                    SvgPicture.asset(
                      AppIcons.message,
                      height: 15,
                    ),
                    SizedBox(width: 1.w),
                    AppTextWidget(
                      text: comments,
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }

  Widget buildSuggestion(profileImage, username, email) {
    return Container(
      width: 25.w,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: primaryColor,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(profileImage),
            ),
          ),
          SizedBox(height: 0.5.h),
          AppTextWidget(
            text: username,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),

          AppTextWidget(
            text: email,
            fontSize: 11,
            color: const Color(0xff6F6D6D),
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 1.h),
          // Follow button
          AppButtonWidget(
              width: 20.w,
              alignment: Alignment.center,
              height: 3.h,
              radius: 100,
              onPressed: () {},
              fontSize: 13,
              fontWeight: FontWeight.w500,
              text: 'Follow')
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> names = [
    "Farhan",
    "Amir",
    "Rehman",
    "Fahad",
    "Uzair",
    "Hafiz jee",
  ];

  @override
  String get searchFieldLabel => 'Search';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[300],
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,

        ),

        // prefixIcon: Padding(
        //   padding: EdgeInsets.only(left: 15, right: 10),
        //   child: Icon(Icons.search, color: Colors.orange),
        // ),
      ),
    );
  }


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      GestureDetector(
          onTap: () {
            query = "";
          },
          child: Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: SvgPicture.asset(AppIcons.close),
          )),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return AppBackButton(
      onTap: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    final results = provider.users.where((user) {
      return user.username.toString().toLowerCase().contains(query.toLowerCase()) ||
          user.nickname.toString().toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final user = results[index];

          return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(user.imageUrl.toString()),
              ),
              title: AppTextWidget(text:user.username.toString(),fontSize: 16,textAlign: TextAlign.start,fontWeight: FontWeight.w500),
              subtitle: AppTextWidget(text: '${user.nickname} \n${user.followers} Followers',fontSize: 10,textAlign: TextAlign.start,fontWeight: FontWeight.w300,),
              trailing: GestureDetector(
                onTap: () {
                  provider.toggleFollowStatus(user);
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: 80,  // Set the desired width
                  height: 30,
                  decoration: BoxDecoration(
                    color: user.isFollowing ? Colors.grey : primaryColor,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(
                    child: Text(user.isFollowing ? 'Following' : 'Follow',style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),),
                  ),
                ),
              ));
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    final results = provider.users.where((user) {
      return user.username.toString().toLowerCase().contains(query.toLowerCase()) ||
          user.nickname.toString().toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final user = results[index];

          return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(user.imageUrl.toString()),
              ),
              title: AppTextWidget(text:user.username.toString(),fontSize: 16,textAlign: TextAlign.start,fontWeight: FontWeight.w500,),
              subtitle: AppTextWidget(text: '${user.nickname} \n${user.followers} Followers',fontSize: 12,textAlign: TextAlign.start,fontWeight: FontWeight.w300,),
              trailing: GestureDetector(
                onTap: () {
                  provider.toggleFollowStatus(user);
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                      color: user.isFollowing ? Colors.grey : primaryColor,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(
                    child: Text(user.isFollowing ? 'Following' : 'Follow',style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),),
                  ),
                ),
              ));
        });
  }
}
