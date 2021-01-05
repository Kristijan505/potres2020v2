import 'package:json_annotation/json_annotation.dart';

part 'api_token.g.dart';

@JsonSerializable()
class ApiToken {
  ApiToken(this.accessToken, this.refreshToken, this.tokenType, this.expiresIn);

  factory ApiToken.fromJson(Map<String, dynamic> json) => _$ApiTokenFromJson(json);

  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @JsonKey(name: 'token_type')
  final String tokenType;

  @JsonKey(name: 'expires_in')
  final int expiresIn;
}
