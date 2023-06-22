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
  
  var value;
  

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
          title: Text(
            "Edit User",
            style: Utils.boldText(),
          ),
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
                      margin: const EdgeInsets.only(bottom: 50),
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const CircleAvatar(
                        backgroundColor: Color(0xd9d9d9d9),
                        // backgroundImage: AssetImage(),
                      )),
                ),
                formRow(value, 'First Name', 'Prénom', _userFirstName),
                formRow(value, 'Last Name', 'Nom', _userLastName),
                formRow(value, 'Age', 'Age', _userAge),  
                const SizedBox(height: 15,)   ,          
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      child:  Text('Update', style: Utils.regularText()),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
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

                          showDialog(
                            context: (context),
                            builder: (context) {
                              return SimpleDialog(
                                
                                title:  Text("Save changes?", style: Utils.boldText(),
                                    textAlign: TextAlign.center),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:0,left:5 ,bottom: 5 ,right:5 ),
                                    child: Column(children: [
                                       Container(
                                         padding: const EdgeInsets.only(left:5, right: 5),
                                         child: Text(
                                            'The modifications you made will update the data',style: Utils.regularText(),
                                            textAlign: TextAlign.center),
                                       ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      Align(
                                        // alignment: Alignment.center,
                                        child: Wrap(
                                          children: [
                                            SizedBox(
                                              width: 110,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(const Color(0xd9d9d9d9)),
                                                ),
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    fontFamily: 'JetBrain',
                                                    color: Colors.black
                                               ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            SizedBox(
                                              width: 110,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const HomePage()));
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(Colors.black)),
                                                child:
                                                    const Text('Save',style: TextStyle(
                                                      fontFamily: 'JetBrain',

                                                    ),),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                                  )
                                ],
                              );
                            },
                          );
                        }
                      }),
                ),
              ])),
        ));
  }

    Container formRow(val, String label, String hint, usercontroller) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Utils.boldText(),
            ),
            const SizedBox(height: 3),
            TextFormField(
              cursorColor: Colors.black,
              style: const TextStyle(fontFamily: 'JetBrain'),
              decoration: InputDecoration(
                // labelText: 'FirstName',
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black, width: 2)),
                hintText: hint,
              ),
              onChanged: (val) {},
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'tu dois completer le champs';
                }
                return null;
              },
              controller: usercontroller,
            ),
          ],
        ),
      );
    }
  }
