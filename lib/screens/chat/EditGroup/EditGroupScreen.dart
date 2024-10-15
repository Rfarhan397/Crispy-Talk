import 'package:crispytalk/model/res/components/app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../model/res/constant/app_icons.dart';
import '../../../model/res/widgets/app_text_field.dart';
import '../../../provider/user_provider/user_provider.dart';

class EditGroupScreen extends StatelessWidget {
   EditGroupScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              AppBackButton(),
              Container(
                height: 50,
                width: 75.w,
                decoration:  BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(14)
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
                        hintText: "Type the Group Name",
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
                    ),
                  ],
                ),
              ),

            ],
          ),
          SizedBox(height: 1.h,),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(

            ),
          )
        ],
      )),
    );
  }
}
