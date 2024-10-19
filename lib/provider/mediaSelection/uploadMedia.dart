import 'package:crispytalk/constant.dart';
import 'package:crispytalk/model/res/components/app_back_button.dart';
import 'package:crispytalk/model/res/components/app_button_widget.dart';
import 'package:crispytalk/model/res/routes/routes_name.dart';
import 'package:crispytalk/model/res/widgets/app_text.dart.dart';
import 'package:crispytalk/provider/action/action_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../model/res/constant/app_icons.dart';

class UploadMediaScreen extends StatelessWidget {
   UploadMediaScreen({super.key});

  final greyColor = const Color(0xffD9D9D9);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ActionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        leading: const AppBackButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          TextField(
            maxLength: 90,
            decoration: InputDecoration(
              hintText: 'Add a Catchy title',

              contentPadding: const EdgeInsets.symmetric(horizontal: 18),
              hintStyle: TextStyle(
                fontSize: 16,
                color: greyColor,
                fontWeight: FontWeight.w600,
              )
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 3.h),
            child: GestureDetector(
              onTap: () {
                _showPrivacySettingsBottomSheet(context);

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.group),
                      const SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppTextWidget(
                            text:
                            "Who can see this post?",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                          ),
                           AppTextWidget(
                            text:
                            provider.selectedOption,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: primaryColor,
                          width: 2
                        )
                      ),
                      child: const Center(child: Icon(Icons.arrow_forward_ios,size: 12, color: Colors.orange))),
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:4.w,vertical: 2.h),
            child: AppButtonWidget(
              width: 30.w,
                alignment: Alignment.centerRight,
                radius: 8,
                onPressed: () {
                Get.toNamed(RoutesName.mainScreen);
                },
                text: 'Post'),
          )
          // AppTextField(
          //
          //   hintText: 'Add a Catchy title',)
        ],
      ),
    );
  }
   void _showPrivacySettingsBottomSheet(BuildContext context) {
     showModalBottomSheet(
       context: context,
       isScrollControlled: true,
       builder: (context) {
         return Container(
           //padding: const EdgeInsets.all(16.0),
           decoration: const BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
           ),
           child: Column(
             mainAxisSize: MainAxisSize.min,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 padding: const EdgeInsets.all(16.0),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(
                     topRight: Radius.circular(12),
                     topLeft: Radius.circular(12)
                   ),
                   color:   Color(0xffFDCD9D)
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const SizedBox(),
                     const AppTextWidget(
                       text: "Privacy Setting",
                         fontSize: 18,
                         fontWeight: FontWeight.bold,

                     ),
                     GestureDetector(
                         onTap: () {
                           Get.back();
                         },
                         child: const Icon(Icons.close),
                     ),
                   ],
                 ),
               ),
                SizedBox(height: 2.h),
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 4.w),
                 child: const AppTextWidget(text: 'Who can see this post?',
                   fontSize: 16,
                   fontWeight: FontWeight.w400,

                 ),
               ),
                SizedBox(height: 1.h),
               Consumer<ActionProvider>(
                 builder: (context, provider, _) {
                   return Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 4.w),
                     child: Column(
                       children: [
                         _privacyOption(context, "Everyone", "Everyone on crisy talk", provider),
                         _privacyOption(context, "Friends", "Follow you and Follow back", provider),
                         _privacyOption(context, "Only You", "Only you can see the post", provider),
                       ],
                     ),
                   );
                 },
               ),  ],
           ),
         );
       },
     );
   }

   Widget _privacyOption(BuildContext context, String title, String subtitle, ActionProvider provider) {
     bool isSelected = provider.isSelected(title);

     return GestureDetector(
       onTap: () {
         provider.selectOption(title);
         Get.back();

       },
       child: Container(
         padding: EdgeInsets.symmetric(vertical: 1.h),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 AppTextWidget(
                   text: title,
                   fontSize: 16.0,
                   fontWeight: FontWeight.w500,
                 ),
                 AppTextWidget(
                   text: subtitle,
                   fontSize: 14,
                   fontWeight: FontWeight.w400,
                   color: greyColor,
                 ),
               ],
             ),
             Radio<String>(
               value: title,
               groupValue: provider.selectedOption,
               onChanged: (value) {
                 if (value != null) {
                   provider.selectOption(value);
                   Get.back();
                 }
               },
               activeColor: primaryColor,
             ),
           ],
         ),
       ),
     );
   }}
