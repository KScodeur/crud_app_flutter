import 'package:flutter/material.dart';
import 'package:user_app_flutter/Models/user_model.dart';

import '../Widgets/usersAllWidget.dart';
import '../Widgets/usersListWidget.dart';
import 'add_user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users",style: TextStyle(fontFamily: 'JetBrain'),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body:const UserAllWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  AddUser()));
        },
        child: const Icon(Icons.create),
      ),
      bottomNavigationBar: NavigationBar(destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.notifications), label: "Profile")
      ]),
    );
  }
}
