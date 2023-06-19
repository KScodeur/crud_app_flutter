import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:io';

import '../Models/user_model.dart';
import '../Widgets/Utils.dart';
import '../db/users_database.dart';
import 'home_page.dart';

class EditUser extends StatefulWidget {
  final id;
  final firstName;
  final lastName;
  final age;

  const EditUser(
      {Key? key,
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.age})
      : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  // final TextEditingController _userFirstName = TextEditingController();
  // final TextEditingController _userLastName = TextEditingController();
  // final TextEditingController _userAge = TextEditingController();
  // final TextEditingController _userId = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _userFirstName;
  late TextEditingController _userLastName;
  late TextEditingController _userAge;
  late TextEditingController _userId;
 

  @override
  void dispose() {
    _userFirstName.dispose();
    _userLastName.dispose();
    _userAge.dispose();
    _userId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _userFirstName = TextEditingController(text: widget.firstName);
    _userLastName = TextEditingController(text: widget.lastName);
    _userAge = TextEditingController(text: widget.age.toString());
    _userId = TextEditingController(text: widget.id.toString());

    return Scaffold(
      appBar: AppBar(
        title:  Text("Edit User", style:  Utils.boldText(),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(children: [
            InkWell(
              onTap: () {
                debugPrint(widget.firstName);

                // chooseProfileImage();
              },
              child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  margin: const EdgeInsets.only(bottom: 50),
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const CircleAvatar(
                    backgroundColor: Color(0xf2f2f2f2),
                    // backgroundImage: AssetImage(),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: TextFormField(
                controller: _userFirstName,
                decoration: const InputDecoration(
                  labelText: 'id',
                  border: OutlineInputBorder(),
                  hintText: 'Prénom',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'tu dois completer le champs';
                  }
                  return null;
                },
                onChanged: (value){},
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: TextFormField(

                decoration: const InputDecoration(
                  hintStyle: TextStyle(fontFamily: 'JetBrain'),
                  labelText: 'LastName',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'tu dois completer le champs';
                  }
                  return null;
                },
                controller: _userLastName,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                  hintText: 'Age',
                ),
                onChanged: (value) {
                  
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'tu dois completer le champs';
                  }
                  return null;
                },
                controller: _userAge,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                child: Text('Update'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  // debugPrint(_formKey.currentState as String?);
                  if (_formKey.currentState!.validate()) {
                    final firstName = _userFirstName.text;
                    final lastName = _userLastName.text;
                    final age = int.parse(_userAge.text);
                    final userId = int.parse(_userId.text);
                    //   // int age = int.parse(ages);
                    //   //Pour envoyer un message lors de l'envoie
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       const SnackBar(content: Text('envoi en cours')));
                    //   //Faire disparaitre le clavier lors de l'envoie
                    //   FocusScope.of(context).requestFocus(FocusNode());
                    //   // debugPrint('${age}');

                    debugPrint(lastName);
                    UsersDatabase.updateUser(User(
                        id: userId,
                        age: age,
                        firstName: firstName,
                        lastName: lastName));


                     showDialog(context: (context),
                     builder: (context){
                       return SimpleDialog(
                        title: const Text("Save changes?",textAlign: TextAlign.center),
                        children: [
                          Padding(
                            padding: const  EdgeInsets.all(10),
                            child: Column(
                                children: [
                                  const SizedBox(height: 15.0,),
                                  const Text('The modifications you made will update the data', textAlign: TextAlign.center),
                                  const SizedBox(height: 15.0,),
                                  Align(
                                    alignment: Alignment.center,
                                    child:  Wrap(
                                      children: [
                                         SizedBox(
                                          width: 120.0,
                                          child: ElevatedButton(
                                            onPressed:  (){
                                              Navigator.of(context).pop();
                                              Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => const HomePage()));
                                            },
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                                                  200, 196, 191, 191)),
                     
                                            ),
                                            child: Text('Cancel', style: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),),
                                          ),
                                         
                                        ),
                                        SizedBox(width: 10),

                                        SizedBox(
                                          child: ElevatedButton(
                                              onPressed:  (){
                                                Navigator.of(context).pop();
                                                Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => const HomePage()));
                                              },
                                              // style: ButtonStyle(backgroundColor: ),
                                              child: const Text('Save changes'),
                                            ),
                                        ),
                                      ],
                                    ),
                                  )
                     
                            ]),
                            )
                        ],
                         );
                       },);
                  }
                  }
              ),
          ),
          ])
        ),
      )
    );
              
            
  }
}
