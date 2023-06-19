import 'package:flutter/material.dart';
import 'package:user_app_flutter/Pages/user_profile.dart';

import '../Models/user_model.dart';

class UserItemWidget extends StatelessWidget {
  final User user;
  final VoidCallback onTap;
  const UserItemWidget({Key? key, required this.user, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => ProfilePage(),
        //     ));
      },
      child: Row(
        children: [
          Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(15),
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const CircleAvatar(
                    backgroundColor: Color(0xf2f2f2f2),
                    // backgroundImage: AssetImage(['image']),
                  ))
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.firstName as String),
                Text('${user.age} ans')
              ],
            ),
          )
        ],
      ),
    );
  }
}
