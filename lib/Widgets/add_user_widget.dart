import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                decoration: const InputDecoration(
                  labelText: 'FirstName',
                  border: OutlineInputBorder(),
      

                  hintText: 'Prénom',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'tu dois completer le champs';
                  }
                  return null;
                },
                controller: userFirstNameController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'LastName',
                  border: OutlineInputBorder(),
                  hintText: 'Nom',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'tu dois completer le champs';
                  }
                  return null;
                },
                controller: userLastNameController,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'tu dois completer le champs';
                  }
                  return null;
                },
                controller: userAgeController,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final firstName = userFirstNameController.text;
                    final lastName = userLastNameController.text;
                    final age = userAgeController.text;
                    //Pour envoyer un message lors de l'envoie
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('envoi en cours')));
                    //Faire disparaitre le clavier lors de l'envoie
                    FocusScope.of(context).requestFocus(FocusNode());
                    // debugPrint('${age}');
                    UsersDatabase.addUsers(User(
                      id: null,
                      age: int.parse(age),
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
                child: Text(user == null ? 'Save' : 'Edit'),
              ),
            )
          ]),
        );
  }
}

