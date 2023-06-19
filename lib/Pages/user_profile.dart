import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../Models/user_model.dart';
import '../Widgets/add_user_widget.dart';
import '../Widgets/userProfileWidget.dart';

class UserProfile extends ConsumerWidget {
  final User user;
  const UserProfile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ProfilePage(
        user: user,
      ),
    );
  }
}
