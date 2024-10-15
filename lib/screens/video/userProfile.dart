import 'package:crispytalk/model/res/constant/app_assets.dart';
import 'package:crispytalk/model/res/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            child: Container(
              height: 220,
              width: 100.w,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  AppAssets.userBg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Circular Profile Image
          Positioned(
            top: 150, // Adjusted to better align with the background
            left: MediaQuery.of(context).size.width * 0.5 - 50, // Center the profile image
            child: CircleAvatar(
              radius: 46,
              backgroundImage: AssetImage(
                AppAssets.lady,
              ),
            ),
          ),

          // Back Button
          Positioned(
            top: 4.h,
            left: 1.w,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop(); // Add functionality here
              },
            ),
          ),

          // Popup Menu Button
          Positioned(
            right: 2.w,
            top: 5.h,
            child: PopupMenuButton<String>(
              icon: SvgPicture.asset(AppIcons.menu), // Replace with your menu icon
              onSelected: (value) {
                if (value == 'Block') {
                  print('Block selected');
                } else if (value == 'Report') {
                  print('Report selected');
                }
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Block',
                    child: Text('Block', style: TextStyle(color: Colors.black)),
                  ),
                  PopupMenuItem<String>(
                    value: 'Report',
                    child: Text('Report', style: TextStyle(color: Colors.black)),
                  ),
                ];
              },
            ),
          ),
        ],
      ),
    );
  }
}
