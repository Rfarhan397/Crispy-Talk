import 'package:crispytalk/constant.dart';
import 'package:crispytalk/model/res/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'app_text.dart.dart';

class CustomDialog extends StatelessWidget {
  final String? content, cancel, yes, hintText, title;
  final TextEditingController? textController;
  final bool showTextField, showTitle;

  const CustomDialog({
    super.key,
    this.content,
    this.cancel,
    this.yes,
    this.showTextField = false,
    this.textController,
    this.hintText,
    this.title,
    this.showTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Optional: for rounded corners
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 400), // Set a maximum height
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showTitle)
                  AppTextWidget(
                    text: title ?? '',
                    color: primaryColor,
                    fontSize: 18,
                  ),
                SizedBox(height: 1.h),
                AppTextWidget(
                  text: content ?? '',
                  color: Colors.black,
                  fontSize: 15,
                ),
                if (showTextField)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: AppTextField(
                      radius: 8,
                      hintText: hintText ?? '',
                      controller: textController, // Use the controller if provided
                    ),
                  ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: primaryColor,
                            width: 1,
                          ),
                        ),
                        child: AppTextWidget(
                          text: cancel ?? '',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w,),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: AppTextWidget(
                          text: yes ?? '',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to show the dialog
  static void show({
    String? content,
    String? cancel,
    String? yes,
    bool showTextField = false,
    TextEditingController? textController,
    String? hintText,
    String? title,
    bool showTitle = false,
  }) {
    Get.dialog(
      CustomDialog(
        content: content,
        cancel: cancel,
        yes: yes,
        showTextField: showTextField,
        textController: textController,
        hintText: hintText,
        title: title,
        showTitle: showTitle,
      ),
    );
  }
}
