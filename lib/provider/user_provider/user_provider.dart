import 'package:crispytalk/model/res/constant/app_assets.dart';
import 'package:flutter/material.dart';

import '../../model/user_model/user_model.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _users = [
    UserModel(
      username: 'Alex',
      nickname: 'alex456',
      imageUrl: AppAssets.lady,
      followers: 106,
      isFollowing: true,
      message: "WOW! this video is very cool"
    ),
    UserModel(
      username: 'Sania',
      nickname: 'Sania678',
      imageUrl: AppAssets.boy,
      followers: 100,
      isFollowing: false,
      message: "Hey are you! why you can’t pick my call?"
    ),
    UserModel(
      username: 'Shoaib',
      nickname: 'Shabi234',
      imageUrl: AppAssets.boy,
      followers: 2500000,
      isFollowing: true,
        message: "Hey are you! why you can’t pick my call?"

    ),
  ];

  List<UserModel> get users => _users;

  void toggleFollowStatus(UserModel user) {
    user.isFollowing = !user.isFollowing;
    notifyListeners();
  }




  ////search in chat///////



  List<UserModel> _filteredUsers = [];

  UserProvider() {
    _filteredUsers = _users; // Initially, show all users
  }

  List<UserModel> get chatUsers => _filteredUsers;

  // Search method to filter the users
  void searchUsers(String query) {
    if (query.isEmpty) {
      _filteredUsers = _users;
    } else {
      _filteredUsers = _users
          .where((user) => user.username.toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void setUsers(List<UserModel> users) {
    _users = users;
    _filteredUsers = _users;
    notifyListeners();
  }



  ////////////checkBox///////

  void toggleCheckbox(int index, bool isChecked) {
    _filteredUsers[index].isChecked = isChecked;
    notifyListeners();
  }

}
