import 'dart:convert';

class UserChangePassword {
  final String username;
  final String oldPassword;
  final String newPassword;

  UserChangePassword(this.username, this.oldPassword, this.newPassword);

  Map<String, dynamic> toJson() => {
        'username': username,
        'oldPassword': oldPassword,
        'newPassword': newPassword
      };

  String toJsonString() => jsonEncode(toJson());
}
