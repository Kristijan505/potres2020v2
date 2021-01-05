import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  LoginRequest(this.username, this.password, this.grantType, this.clientId, this.clientSecret, this.scope);

  static LoginRequest fromCredentials(String username, String password) {
    return LoginRequest(username, password, 'password', 'ushahidiui', '35e7f0bca957836d05ca0492211b0ac707671261', '*');
  }

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  final String username;
  final String password;

  @JsonKey(name: 'grant_type')
  final String grantType;

  @JsonKey(name: 'client_id')
  final String clientId;

  @JsonKey(name: 'client_secret')
  final String clientSecret;

  final String scope;
}
