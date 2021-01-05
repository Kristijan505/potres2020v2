import 'dart:convert';

import 'package:potres2020v2/Models/login/api_token.dart';
import 'package:potres2020v2/Models/login/login_request.dart';
import 'package:http/http.dart' as http;
import 'package:potres2020v2/constants.dart';

class ApiService {

  static Future<ApiToken> login(LoginRequest request) async {
    var response = await http.post(baseUrl + '/oauth/token', body: request.toJson()).timeout(Duration(seconds: 10));
    if (response.statusCode == 401) {
      throw UnAuthorizedException(); // wrong user/pass combination
    }
    return ApiToken.fromJson(jsonDecode(response.body));
  }
}

class UnAuthorizedException implements Exception {}
