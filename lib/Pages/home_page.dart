import 'package:flutter/material.dart';
import 'package:user_app_flutter/Models/user_model.dart';

import '../Widgets/usersAllWidget.dart';
import '../Widgets/usersListWidget.dart';
import 'add_user.dart';
import 'notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
    int currentPage = 0;
    List<Widget> pages =  [UserAllWidget(), NotifPage()];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Users",
          style: TextStyle(fontFamily: 'JetBrain'),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: pages[currentPage],
      // const UserAllWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUser()));
        },
        child: const Icon(Icons.create),
      ),
      bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
            setState(() {
            currentPage = index;  
            });
          },
          selectedIndex:  currentPage,
          height: 60,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.notifications),
                selectedIcon: Icon(Icons.notification_add),
                label: "Profile")
          ]),
    );
  }
}
