import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app_flutter/db/users_database.dart';

import '../../Models/user_model.dart';

class Riverprod
{
  static final userList = FutureProvider<List<User>>((ref) async {

    return UsersDatabase.getAllUsers();
  });

  static final isVisible = StateProvider((ref) => true);
}