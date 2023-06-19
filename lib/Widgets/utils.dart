import 'package:flutter/material.dart';

class Utils{

// static Widget formRow(String value) {
//   return 
  
// }

static TextStyle boldText() {
    return  const TextStyle(
      fontFamily: 'JetBrain',
      fontWeight: FontWeight.bold);
  }

  static TextStyle regularText() {
    return  const TextStyle(
      fontFamily: 'JetBrain',
      fontWeight: FontWeight.normal);
  }

// static Container formRow( ){
//   return Container(
//               margin: const EdgeInsets.only(bottom: 25),
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   labelText:labelText,
//                   border: OutlineInputBorder(),
//                   hintText: 'Age',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'tu dois completer le champs';
//                   }
//                   return null;
//                 },
//                 controller: userAgeController,
//               ),
//             ),
//  }

}