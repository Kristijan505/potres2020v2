
import 'package:potres2020v2/Models/login/api_token.dart';

/// Simple singleton that holds data of the user session - username, tokens, etc.
class UserManager {
  UserManager._internal();

  static final UserManager _instance = UserManager._internal();
  static UserManager get instance => _instance;

  // use this for requests that need token
  ApiToken token;
  String username;


}