import 'package:dart_advanced_modeling/features/q3/user_model.dart';
import 'package:dart_advanced_modeling/helper/helper_method.dart';

class Users {
  static final Users _users = Users._internal();
  factory Users() => _users;
  Users._internal();
  Map<int, UserModel?> _userCache = <int, UserModel?>{};
  Future<UserModel?> loadUser(int id) async {
    if (!_userCache.containsKey(id)) {
      final response = await HelperMethod.getUserById(id);

      _userCache[id] = UserModel.fromJson(response);
     
    }
    
    return _userCache[id];
  }

  Future<Map<int, UserModel?>> get getusers async => _userCache;
}
