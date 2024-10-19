import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:crispytalk/model/res/constant/app_icons.dart';
import 'package:crispytalk/model/res/routes/routes_name.dart';
import 'package:crispytalk/model/res/widgets/app_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../constant.dart';
import '../../../model/res/widgets/app_text.dart.dart';
import '../../../model/user_model/user_model.dart';
import '../../../provider/action/action_provider.dart';
import '../../../provider/user_provider/user_provider.dart';

class CreateGroup extends StatelessWidget {
   CreateGroup({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context); // Access UserProvider
    final menuProvider = Provider.of<ActionProvider>(context); // Access ActionProvider

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (provider.selectedUsers.isEmpty) {
          Get.snackbar(
            'Error',
            'Please select at least one user to create a group',
            backgroundColor: primaryColor,
            colorText: Colors.white,
          );
        } else {
          Get.toNamed(
            RoutesName.editGroup,
            arguments: provider.selectedUsers,
          );
        }
      },
        backgroundColor: Colors.transparent,
        splashColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.transparent,
      child: SvgPicture.asset(AppIcons.next),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Search Bar
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 95.w,
                    decoration: const BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(18),
                            topRight: Radius.circular(18)
                        )
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: SvgPicture.asset(AppIcons.search),
                        ),
                        Expanded(
                          child: AppTextField(
                            focusBdColor: Colors.transparent,
                            controller: _searchController,
                            onChanged: (value) {
                              provider.searchUsers(value); // Trigger search
                            },
                            hintText: "Search",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              _searchController.clear();
                              provider.searchUsers(''); // Reset search when clear is clicked
                            },
                            child: SvgPicture.asset(AppIcons.close),
                          ),
                        )
                      ],
                    ),
                  ),
                  // PopupMenuButton<String>(
                  //   color: primaryColor,
                  //   icon: SvgPicture.asset(AppIcons.menu),
                  //   onSelected: (value) {
                  //     menuProvider.setSelectedItem(value);
                  //     // Handle actions for the menu
                  //     if (value == 'Create new Group') {
                  //       Get.toNamed(RoutesName.createGroup);
                  //       log('Create new Group selected');
                  //     } else if (value == 'Old Groups') {
                  //       log('Old Groups selected');
                  //     }
                  //   },
                  //   itemBuilder: (BuildContext context) {
                  //     return [
                  //       buildMenuItem(context, 'Create new Group', menuProvider),
                  //       buildMenuItem(context, 'Old Groups', menuProvider),
                  //     ];
                  //   },
                  // ),
                ],
              ),
              SizedBox(height: 2.h),

              // User List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.chatUsers.length,
                itemBuilder: (context, index) {
                  log('Hello ::${provider.chatUsers.toString()}');
                  UserModel user = provider.chatUsers[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ListTile(
                      leading: Stack(
                        clipBehavior: Clip.hardEdge,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(user.imageUrl.toString()), // User's profile image
                          ),
                          Positioned(
                            bottom: 2,
                            right: 3,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                color: Colors.green, // Online indicator
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: AppTextWidget(
                        text: user.username.toString(), // Display user name
                        fontSize: 16,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w500,
                      ),
                      subtitle: AppTextWidget(
                        text: user.message.toString(), // Display user message
                        fontSize: 10,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w300,
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const AppTextWidget(
                            text: '01:33 PM', // Placeholder for time
                            fontSize: 10,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 2.h,),
                          CustomCheckbox(
                            isChecked: user.isChecked,
                            onChanged: (newValue) {
                              provider.toggleCheckbox(index, newValue);
                            },
                            activeColor: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuItem<String> buildMenuItem(BuildContext context, String value, ActionProvider menuProvider) {
    return PopupMenuItem<String>(
      value: value,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: menuProvider.selectedItem == value ? const Color(0xffEDFE19) : Colors.transparent,
        ),
        child: Text(
          value,
          style: TextStyle(
            color: menuProvider.selectedItem == value ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.activeColor = primaryColor,
    this.inactiveColor = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked); // Toggle the checked state
      },
      child: Container(
        width: 20,
        height: 15,
        decoration: BoxDecoration(
          color: isChecked ? activeColor : Colors.transparent,
          border: Border.all(
            color: isChecked ? activeColor : inactiveColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: isChecked
            ? const Icon(
          Icons.check,
          size: 16,
          color: Colors.white,
        )
            : null, // Show checkmark only if checked
      ),
    );
  }
}