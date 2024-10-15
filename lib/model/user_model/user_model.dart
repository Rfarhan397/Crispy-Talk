class UserModel {
  final String? username;
  final String? nickname;
  final String? imageUrl;
  final String? message;
  final int? followers;
  bool isFollowing;
  bool isChecked;

  UserModel( {
    this.message,
     this.username,
     this.nickname,
     this.imageUrl,
     this.followers,
    this.isFollowing = false,
    this.isChecked = false,
  });
}
