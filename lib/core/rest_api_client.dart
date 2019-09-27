import 'dart:async';
import 'dart:convert';
import '../models/user_login.dart';
import '../models/user_auth_resp.dart';
import 'package:http/http.dart' as http;

class RestApiClient {
  final String baseUrl;

  RestApiClient(this.baseUrl);

  Future<UserAuthResp> login(UserLogin login) async {
    return UserAuthResp(false, "Not implemented yet");
    /*
    try {
      var resp = await http.post("$baseUrl/api/login", body: login.toJson());
      Map uResp = jsonDecode(resp.body);
      return new UserAuthResp(uResp['isSuccess'], uResp['message']);
    } catch (e) {
      return new UserAuthResp(false, e);
    }
    */
  }
}
