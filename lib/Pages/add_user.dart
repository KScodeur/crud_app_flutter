import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_app_flutter/Widgets/utils.dart';

import '../Models/user_model.dart';
import '../Widgets/add_user_widget.dart';
import '../db/users_database.dart';
import 'home_page.dart';

class AddUser extends ConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Create Profile", style: Utils.boldText(),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: const addWidget(),
      ),
    );
  }
}
