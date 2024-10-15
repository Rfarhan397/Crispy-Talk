import 'package:crispytalk/constant.dart';
import 'package:crispytalk/model/res/widgets/app_text.dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final String? content,cancel,yes;
  const CustomDialog({super.key, this.content, this.cancel, this.yes});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      // title: const AppTextWidget(text:
      //   'Delete Account!',
      //   fontSize: 22,
      //   color: Colors.white),
      content:  AppTextWidget(text:
       content.toString(),
        color: Colors.black,
        fontSize: 18,
      ),
      actions: <Widget>[
        // No Button
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 80,
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: primaryColor,
                width: 1,
              )
            ),
            child:  AppTextWidget(text:
              cancel.toString(),
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: primaryColor),
          ),
        ),
        // Yes Button
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 80,
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
            decoration: BoxDecoration(
                color: primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child:  AppTextWidget(text:
              yes.toString(),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              color: Colors.white),
          ),
        ),
      ],
    );
  }
}
