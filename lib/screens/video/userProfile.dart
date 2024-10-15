import 'package:crispytalk/constant.dart';
import 'package:crispytalk/model/res/components/app_button_widget.dart';
import 'package:crispytalk/model/res/constant/app_assets.dart';
import 'package:crispytalk/model/res/constant/app_colors.dart';
import 'package:crispytalk/model/res/constant/app_icons.dart';
import 'package:crispytalk/model/res/widgets/app_text.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: // Back Button
            IconButton(
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
                print('Block selected');
              } else if (value == 'Report') {
                print('Report selected');
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
      body: Column(
        children: [
          // Background Image
          SizedBox(
            height: 220,
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
            offset:  Offset(0, -10.h),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(56)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(56),
                      child: Image.asset(
                        AppAssets.lady,
                        fit: BoxFit.cover,
                      ),
                    )),
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
                      )),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset:  Offset(0, -8.h),
            child:  Column(
              children: [
              const AppTextWidget(text: 'Mian Uzair',fontWeight: FontWeight.w600,color: primaryColor,fontSize: 18,),
              const AppTextWidget(text: 'I am delights Introduce the myself\ni am a proffesional Model',
                fontWeight: FontWeight.w400,color: AppColors.textGrey,fontSize: 12,),
                SizedBox(height: 1.h,),
                SizedBox(
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 1.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Followers Column
                        buildFollow("567k","Followers"),
                        // Vertical Divider
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: VerticalDivider(
                            width: 20,
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                        buildFollow("1234","Following"),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: VerticalDivider(
                            width: 20,
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                        buildFollow("456k","likes"),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButtonWidget(
                      prefixIcon: SvgPicture.asset(AppIcons.editProfile),
                        onPressed: () {},
                        radius: 12,
                        fontSize: 12,
                        width: 30.w,
                        text: 'Edit Profile'),
                    SizedBox(width: 3.w,),
                    AppButtonWidget(
                      prefixIcon: SvgPicture.asset(AppIcons.shareProfile),
                        onPressed: () {},
                        radius: 12,
                        fontSize: 12,
                        width: 30.w,
                        text: 'Share Profile'),
                  ],
                ),
                 const DefaultTabController(
                  length: 2,
                  child: SizedBox(
                    width: 200,
                    child: TabBar(
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                      tabs: [
                        Tab(
                          icon: Icon(Icons.grid_view,color: Colors.black,),
                        ),
                        Tab(
                          icon: Icon(Icons.bookmark_border,color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                )

              ],

            ),
          )

          // Popup Menu Button
        ],
      ),
    );
  }

  Column buildFollow(title,subtitle,) {
    return Column(
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
                      );
  }
}
