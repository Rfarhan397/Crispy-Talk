import 'package:crispytalk/constant.dart';
import 'package:crispytalk/model/res/constant/app_assets.dart';
import 'package:crispytalk/model/res/constant/app_icons.dart';
import 'package:crispytalk/model/res/widgets/app_text.dart.dart';
import 'package:crispytalk/model/res/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../model/user_model/user_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;

    // Check if the arguments are for a 1-on-1 chat or a group chat
    if (arguments is UserModel) {
      // Handle 1-on-1 chat with UserModel
      return _buildIndividualChatScreen(context,arguments);
    } else if (arguments is Map<String, dynamic>) {
      // Handle group chat with groupName and selectedUsers
      return _buildGroupChatScreen(context,arguments['groupName'], arguments['selectedUsers']);
    } else {
      // Fallback in case of unexpected argument type
      return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text("Chat"),
        ),
        body: const Center(child: Text("Invalid chat data")),
      );
    }
  }

  // Build the UI for an individual chat (1-on-1 chat)
  Widget _buildIndividualChatScreen(BuildContext context,UserModel user) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        shadowColor: primaryColor,
        centerTitle: false,
        leading: GestureDetector(onTap: () {
          Get.back();
        }, child: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white)),
        title: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(50)
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(fit: BoxFit.cover, user.imageUrl.toString().isNotEmpty ? user.imageUrl.toString() : AppAssets.lady)
            ),
          ),
          title: AppTextWidget(
            text: user.username.toString().isNotEmpty ? user.username.toString() : 'Unknown',
            textAlign: TextAlign.start,
            color: Colors.white,
            fontSize: 15,
          ),
          subtitle: const AppTextWidget(text: 'Online', textAlign: TextAlign.start, color: Colors.white),
        ),
        actions: [
          GestureDetector(onTap: () => Get.back(), child: SvgPicture.asset(AppIcons.call, height: 18)),
          const SizedBox(width: 16),
          GestureDetector(onTap: () => Get.back(), child: SvgPicture.asset(AppIcons.videoCall, height: 18)),
          const SizedBox(width: 16),
          GestureDetector(onTap: () => Get.back(), child: SvgPicture.asset(AppIcons.more, height: 18)),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                _buildMessageBubble("Hello!", isSender: true, time: "12:00 PM"),
                _buildMessageBubble("Hi! How are you?", isSender: false, time: "12:01 PM"),
                _buildMessageBubble("I'm good, thanks! 😊", isSender: true, time: "12:02 PM"),
              ],
            ),
          ),
          _buildMessageInputField(context),
        ],
      ),
    );
  }

  // Build the UI for a group chat
  Widget _buildGroupChatScreen(BuildContext context,String groupName, List<UserModel> selectedUsers) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        shadowColor: primaryColor,
        centerTitle: false,
        leading: GestureDetector(onTap: () {
          Get.back();
        }, child: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white)),
        title: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(50)
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(fit: BoxFit.cover, AppAssets.person) // Placeholder for group image
            ),
          ),
          title: AppTextWidget(
            text: groupName,
            textAlign: TextAlign.start,
            color: Colors.white,
            fontSize: 15,
          ),
          subtitle: const AppTextWidget(text: 'Group Chat', textAlign: TextAlign.start, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                _buildMessageBubble("Welcome to $groupName group chat!", isSender: true, time: "12:00 PM"),
              ],
            ),
          ),
          _buildMessageInputField(context),
        ],
      ),
    );
  }

  // Message Bubble
  Widget _buildMessageBubble(String message, {required bool isSender, required String time}) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: isSender ? primaryColor : Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: AppTextWidget(
              text: message,
              color: isSender ? Colors.white : Colors.black,
            ),
          ),
          Align(
            alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
            child: AppTextWidget(
              text: time,
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  // Message Input Field
  Widget _buildMessageInputField(context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: primaryColor,
      child: Row(
        children: [
          Expanded(
            child: AppTextField(
              hintText: "Type a message...",
              focusBdColor: Colors.white,
              fillColor: Colors.transparent,
              borderSides: true,
              radius: 50,
              hintColor: Colors.white,
              bdColor: Colors.white,
              enableBorderColor: Colors.white,
              suffixIcon: GestureDetector(
                onTap: () {
                  _showBottomSheet(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(AppIcons.link),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              String message = messageController.text;
              messageController.clear();
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppIcons.share, color: primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Bottom Sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIconOption(
                icon: Icons.description,
                label: 'Document',
                color: primaryColor,
                press: () async {},
              ),
              _buildIconOption(
                icon: Icons.photo,
                label: 'Gallery',
                color: primaryColor,
                press: () async {},
              ),
              _buildIconOption(
                icon: Icons.headphones,
                label: 'Audio',
                color: primaryColor,
                press: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIconOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback press,
  }) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
