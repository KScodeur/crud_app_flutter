import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app_flutter/ViewModel.dart/riverprod/riverprod.dart';
import 'package:user_app_flutter/Widgets/userProfileWidget.dart';
import 'package:user_app_flutter/Widgets/userProfileWidget.dart';
import 'package:user_app_flutter/Widgets/Utils.dart';

import '../Models/user_model.dart';
import '../Pages/user_profile.dart';
import '../db/users_database.dart';

class UserAllWidget extends ConsumerStatefulWidget {
  const UserAllWidget({super.key});

  @override
  ConsumerState<UserAllWidget> createState() => _UserAllWidgetState();
}

class _UserAllWidgetState extends ConsumerState<UserAllWidget> {
  // UsersDatabase _usersDatabase = UsersDatabase.db;
  // UsersDatabase? usersDatabase;
  late Future<List<User>> dataList;
  @override
  void initState() {
    super.initState();
    ref.read(Riverprod.userList);
    // UsersDatabase;
    loadData();
  }

  loadData() async {
    dataList = UsersDatabase.getAllUsers();
  }

  User? user;
  @override
  Widget build(BuildContext context) {
    // ref.watch(Riverprod.userList);

    return FutureBuilder<List<User>>(
        future: dataList,
        builder: (context, AsyncSnapshot<List<User>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.data!.isEmpty) {
            return  Center(
              child: Text('No data',style: Utils.boldText(),),
            );
          } else {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  int user_id = snapshot.data![index].id!.toInt();
                  String firstName = snapshot.data![index].firstName.toString();
                  String lastName = snapshot.data![index].lastName.toString();
                  String age = snapshot.data![index].age.toString();
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserProfile(
                              user: snapshot.data![index],
                            ),
                          ));
                    },
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top:15, left: 15, right: 15,bottom: 7),
                                height: 55,
                                width: 55,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: const CircleAvatar(
                                  backgroundColor: Color(0xd9d9d9d9),
                                  child: Icon(Icons.person,size: 45, color: Colors.black,),
                                  // backgroundImage: AssetImage(['image']),
                                ))
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '$firstName $lastName',
                                    style: Utils.boldText(),
                                  ),
                                  
                                ],
                              ),
                              Text('$age ans', style: Utils.boldText()),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }));
          }
        });
  }


}
