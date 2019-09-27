class UserLogin {
  final String username;
  final String password;

  UserLogin(this.username, this.password);

  UserLogin.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}
