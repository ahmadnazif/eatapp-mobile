import 'dart:convert';

class UserAuthResp {
  final bool isSuccess;
  final String message;

  UserAuthResp(this.isSuccess, this.message);

  Map<String, dynamic> toJson() => {'isSuccess': isSuccess, 'message': message};

  String toJsonString() => jsonEncode(toJson());
}
