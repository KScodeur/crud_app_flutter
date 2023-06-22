import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app_flutter/Widgets/utils.dart';
import 'package:image_picker/image_picker.dart';

import '../Models/user_model.dart';
import '../Pages/home_page.dart';
import '../db/users_database.dart';

class addWidget extends ConsumerStatefulWidget {
  const addWidget({super.key});

  @override
  ConsumerState<addWidget> createState() => _addWidgetState();
}

class _addWidgetState extends ConsumerState<addWidget> {
    UsersDatabase? usersDatabase;
  late Future<List<User>> dataList;

  final _formKey = GlobalKey<FormState>();
  
  var value;
  @override
  void initState() {
    super.initState();
    UsersDatabase;
    loadData();
  }

  loadData() async {
    dataList = UsersDatabase.getAllUsers();
  }

  User? user;
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  final userFirstNameController = TextEditingController();
  final userLastNameController = TextEditingController();
  final userAgeController = TextEditingController();

  chooseProfileImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Form(
          key: _formKey,
          child: Column(children: [
            InkWell(
              onTap: () {
                chooseProfileImage();
              },
              child: Container(
                  // padding: const EdgeInsets.only(top: 10),
                  margin: const EdgeInsets.only(bottom: 40),
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const CircleAvatar(
                    backgroundColor: Color(0xd9d9d9d9),
                    // backgroundImage: imageFile 
                  )),
            ),
            formRow(value, 'First name', 'Prénom', userFirstNameController,),
            formRow(value, 'Last name', 'Nom', userLastNameController,),
            formRow(value, 'Age', 'Age', userAgeController,),
            const SizedBox(height: 15),
            SizedBox(
              
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final firstName = userFirstNameController.text;
                    final lastName = userLastNameController.text;
                    final age = int.parse(userAgeController.text);
                    //Pour envoyer un message lors de l'envoie
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('envoi en cours')));
                    //Faire disparaitre le clavier lors de l'envoie
                    FocusScope.of(context).requestFocus(FocusNode());
                    // debugPrint('${age}');
                    UsersDatabase.addUsers(User(
                      id: null,
                      age: age,
                      firstName: firstName,
                      lastName: lastName
                    ));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                    userFirstNameController.clear();
                    userLastNameController.clear();
                    userAgeController.clear();
                  }
                },
                child: Text(user == null ? 'Save' : 'Edit', style: Utils.regularText(),),
              ),
            )
          ]),
        );
  }

  Container formRow(val, String label,  String hint, usercontroller) {
    return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Utils.boldText(),),
                SizedBox(height: 3),
                TextFormField(
                  
                  cursorColor: Colors.black,
                  style: TextStyle(fontFamily: 'JetBrain' ),
                  decoration:  InputDecoration(
                    // labelText: 'FirstName',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black, width: 2)
                    ),
                    hintText: hint,
                  ),
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

