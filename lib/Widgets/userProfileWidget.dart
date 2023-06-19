import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app_flutter/Pages/add_user.dart';
import 'package:user_app_flutter/Pages/edit_user.dart';
import 'package:user_app_flutter/db/users_database.dart';

import '../Models/user_model.dart';
import '../Pages/home_page.dart';



class ProfilePage extends ConsumerWidget {
  final User user;
  const ProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Expanded(
              child: Container(
                // height: 500,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          width: 2,
                        ),
                        color: const Color(0xf2f2f2f2)),
                    // margin: const EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 20),
                            height: 120,
                            width: 120,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child:  CircleAvatar(
                              backgroundColor: Colors.black,
                                // backgroundImage: AssetImage(),
                                )),
                        Text('${user.firstName} ${user.lastName}'),
                        Text('${user.age} Y/n'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 40,
              width: double.infinity,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular(255)),),
                child: ElevatedButton( 
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditUser(
                                    id: user.id,
                                    firstName: user.firstName,
                                    lastName: user.lastName,
                                    age: user.age,
                                  )));
                    },
                    child: const Text('Edit Profile')),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 35),
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    UsersDatabase.deleteUser(user);
                    // AlertDialog(
                    //   title: const Text('Suppression'),
                    //   content: const Text(
                    //       "Voulez-vous vraiment faire la suppression"),
                    //   actions: [
                    //     ElevatedButton(
                    //         onPressed: () async {
                    //           // await UsersDatabase.deleteUser(user);
                    //           //  Navigator.pop(context);
                    //           // setState(() {});
                    //         },
                    //         child: const Text('yes'),

                    //         ),
                    //         ElevatedButton(
                    //         onPressed: () =>
                    //           Navigator.pop(context),
                    //           // setState(() {});
                    //         child: const Text('No'))
                    //   ],
                    // );

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Text('Delete User')),
            )
          ],
        ),
      ),
    );
  }
}
