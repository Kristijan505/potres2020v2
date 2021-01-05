// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiToken _$ApiTokenFromJson(Map<String, dynamic> json) {
  return ApiToken(
    json['access_token'] as String,
    json['refresh_token'] as String,
    json['token_type'] as String,
    json['expires_in'] as int,
  );
}

Map<String, dynamic> _$ApiTokenToJson(ApiToken instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
    };
