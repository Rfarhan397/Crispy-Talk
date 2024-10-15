import 'package:crispytalk/constant.dart';
import 'package:crispytalk/main.dart';
import 'package:crispytalk/model/res/constant/app_assets.dart';
import 'package:crispytalk/model/res/routes/routes.dart';
import 'package:crispytalk/model/res/routes/routes_name.dart';
import 'package:crispytalk/model/res/widgets/app_text.dart.dart';
import 'package:crispytalk/provider/action/action_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../model/res/components/app_back_button.dart';
import '../../model/res/constant/app_icons.dart';


class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              AppAssets.lady, // Replace with actual image URL
              fit: BoxFit.cover,
            ),
          ),

          // Back Button
           Positioned(
            top: 5.h,
            left: 3.w,
            child: AppBackButton()
          ),

          Positioned(
            top: 7.h,
            left: MediaQuery.of(context).size.width * 0.4,
            child: const AppTextWidget(
                text: "Following",
              color: Colors.grey,
                fontSize: 18),
          ),

          // Play Button
          Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow_rounded, size: 80, color: Colors.white,),
            ),
          ),

          // Right side icons (Heart, Comment, Share, Favorite)
          Positioned(
            right: 10,
            bottom: 8.h,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesName.userProfile);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppAssets.lady),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(height: 2.h),

                // Heart Icon
                GestureDetector(
                  onTap: () {
                    Provider.of<ActionProvider>(context, listen: false).toggleFavorite();

                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        Provider.of<ActionProvider>(context).isLike?
                        AppIcons.like:
                        AppIcons.notLike,
                        height: 22,
                      ),
                      const AppTextWidget(text: '4.1K', color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Comment Icon
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      BuildBottomSheet(),
                      isScrollControlled: true,
                    );
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.message,
                        height: 22,
                      ),
                      const AppTextWidget(text: '206', color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Share Icon
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      BuildShareBottomSheet( AppAssets.lady,"Sana Jameel"),
                      isScrollControlled: true,
                    );
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.share,
                        height: 22,
                      ),
                      const AppTextWidget(text: 'Share', color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Favorite Icon
                GestureDetector(
                 onTap: () {
                   Provider.of<ActionProvider>(context, listen: false).toggleFavorite();

                 },

                  child: Column(
                    children: [
                      SvgPicture.asset(
                        Provider.of<ActionProvider>(context).isFavorite?
                        AppIcons.save:
                        AppIcons.saveP,
                        height: 22,
                      ),
                      const AppTextWidget(text: 'Favourite', color: Colors.white),

                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Profile, Name, and Description at the Bottom
          const Positioned(
            bottom: 40,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Name
                Text(
                  'Samia Ali',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(height: 5),

                // Video Description
                AppTextWidget(text:
                  'Good Morning #Trending #viral video\n#foryou #100k likes #1M followers',
                  color: Colors.white, fontSize: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget BuildBottomSheet(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextWidget(text:
            'Comments',
            fontSize: 15, fontWeight: FontWeight.w500),

          SizedBox(height: 10),
          Row(
            children: [

              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type a message.....',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black,
                      width: 2
                    )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: primaryColor,
                        width: 2,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.w),
                      child: SizedBox(
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset(AppIcons.share,color: Colors.black,)),
                    ),
                    prefixIcon:  IconButton(
                      icon: Icon(Icons.emoji_emotions_outlined),
                      onPressed: () {
                        // Handle emoji selection
                      },
                    ),
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );

  }
  Widget BuildShareBottomSheet(profileImage, profileName){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextWidget(text:
            'Share Video',
            fontSize: 15, fontWeight: FontWeight.w500),

          SizedBox(height: 10),
          SizedBox(
            height: 100,
            child:ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
              return  Padding(
                padding:  EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              profileImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 1.h),
                          child: AppTextWidget(text:
                          profileName,
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),

                      ],
                    ),
                  ],
                ),
              );
            })

          ),
          SizedBox(height: 20),
        ],
      ),
    );

  }
}