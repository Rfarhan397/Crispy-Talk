import 'package:crispytalk/constant.dart';
import 'package:crispytalk/model/res/widgets/app_text.dart.dart';
import 'package:crispytalk/model/res/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomDialog extends StatelessWidget {
  final String? content,cancel,yes,hintText,title;
  final TextEditingController? textController;
  final bool showTextField,showtitle;
  const CustomDialog({super.key, this.content, this.cancel, this.yes,  this.showTextField = false,
    this.textController, this.hintText, this.title, this.showtitle = false,

  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      // title: const AppTextWidget(text:
      //   'Delete Account!',
      //   fontSize: 22,
      //   color: Colors.white),
      content:  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         if(showtitle)
           AppTextWidget(text:
           title.toString(),
             color: primaryColor,
             fontSize: 18,
           ),
          SizedBox(height: 1.h,),
          AppTextWidget(text:
           content.toString(),
            color: Colors.black,
            fontSize: 15,
          ),
          if (showTextField)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: AppTextField(
                  radius: 8,
                  hintText: hintText.toString())
            ),
        ],
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
