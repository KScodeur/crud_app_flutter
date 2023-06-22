import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app_flutter/Pages/add_user.dart';
import 'package:user_app_flutter/Pages/edit_user.dart';
import 'package:user_app_flutter/db/users_database.dart';

import '../Models/user_model.dart';
import '../Pages/home_page.dart';
import 'Utils.dart';

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
        padding: const EdgeInsets.only(left: 20, right: 20),
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
                        border: Border.all(width: 1, color: Color(0x7a7a7a7a)),
                        color: const Color(0xf2f2f2f2)),
                    // margin: const EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    height: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            height: 120,
                            width: 120,
                            decoration: const BoxDecoration(
                                color: Color(0xf2f2f2f2),
                                shape: BoxShape.circle),
                            child: const CircleAvatar(
                              backgroundColor: Color(0xd9d9d9d9),
                              // backgroundImage: AssetImage(),
                            )),
                        Text(
                          '${user.firstName} ${user.lastName}',
                          style: Utils.boldText(),
                        ),
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
                  borderRadius: BorderRadius.all(Radius.circular(255)),
                ),
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
                    child: Text('Edit Profile', style: Utils.regularText())),
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
                    // showDialog(context: context, builder: builder)
                     showDialog(
        context: (context),
        builder: (context) {
          return SimpleDialog(
            title: Text('titleDialog',
                style: Utils.boldText(), textAlign: TextAlign.center),
            children: [
              Container(
                padding:
                    const EdgeInsets.only(top: 0, left: 5, bottom: 5, right: 5),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Text('contentDialog',
                        style: Utils.regularText(),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: Wrap(
                      children: [
                        SizedBox(
                          width: 110,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xd9d9d9d9)),
                            ),
                            child:  Text(
                              'cancel',
                              style: const TextStyle(
                                  fontFamily: 'JetBrain', color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 110,
                          child: ElevatedButton(
                            onPressed: (){
                              UsersDatabase.deleteUser(user);
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) =>  HomePage()));
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                            child:  Text(
                              'save',
                              style:const  TextStyle(
                                fontFamily: 'JetBrain',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              )
            ],
          );
        });
                  },
                  child: Text('Delete User', style: Utils.regularText())),
            )
          ],
        ),
      ),
    );
  }

  onPressed(context, user) {
 (UsersDatabase.deleteUser(user));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  HomePage()));
  }
}
