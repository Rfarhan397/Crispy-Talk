import 'package:crispytalk/constant.dart';
import 'package:crispytalk/model/res/components/app_back_button.dart';
import 'package:crispytalk/model/res/routes/routes_name.dart';
import 'package:crispytalk/model/res/widgets/app_text.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/app_text_field.dart';
import '../../../model/user_model/user_model.dart';
import '../../../provider/user_provider/user_provider.dart';

class EditGroupScreen extends StatelessWidget {
  EditGroupScreen({super.key});

  final TextEditingController _groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    final List<UserModel> selectedUsers = Get.arguments as List<UserModel>;

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        if (_groupNameController.text.isEmpty ) {
          Get.snackbar('Error', 'Please enter a group name', backgroundColor: primaryColor, colorText: Colors.white);
        }else if(selectedUsers.length <=0) {
          Get.snackbar('Error', 'Add atleast one member', backgroundColor: primaryColor, colorText: Colors.white);

        }
          else
       {
          Get.toNamed(RoutesName.chatScreen,
            arguments: {
              'groupName': _groupNameController.text,
              'selectedUsers': selectedUsers
            },


          );
        }      },
        backgroundColor: Colors.transparent,
        splashColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.transparent,
        child: SvgPicture.asset(AppIcons.next),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const AppBackButton(),
                Container(
                  height: 50,
                  width: 75.w,
                  decoration: BoxDecoration(
                      color: const Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(14)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: SvgPicture.asset(AppIcons.search),
                      ),
                      Expanded(
                        child: AppTextField(
                          focusBdColor: Colors.transparent,
                          controller: _groupNameController,
                          hintText: "Type the Group Name",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            _groupNameController.clear();
                          },
                          child: SvgPicture.asset(AppIcons.close),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: SvgPicture.asset(AppIcons.camera),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const AppTextWidget(
                          text: 'Selected Photo',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const AppTextWidget(
                    text: 'Selected Members',
                    color: primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                      itemCount: selectedUsers.length,
                      itemBuilder: (context, index) {

                        UserModel user = selectedUsers[index];

                        return ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage(user.imageUrl.toString()),
                            ),
                            title: AppTextWidget(
                              text: user.username.toString(),
                              fontSize: 16,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w500,
                            ),
                            subtitle: AppTextWidget(
                              text: '${user.nickname} ',
                              fontSize: 12,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w300,
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                provider.removeUser(user);

                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                width: 70,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(4)),
                                child: const Center(
                                  child: AppTextWidget(text: 'Remove' ,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                  ),
                                ),
                              ),
                            ));
                      }),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
