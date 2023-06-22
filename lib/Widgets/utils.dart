import 'package:flutter/material.dart';

import '../Pages/home_page.dart';

class Utils {
// static Widget formRow(String value) {
//   return

// }

  static TextStyle boldText() {
    return const TextStyle(fontFamily: 'JetBrain', fontWeight: FontWeight.bold);
  }

  static TextStyle regularText() {
    return const TextStyle(
        fontFamily: 'JetBrain', fontWeight: FontWeight.normal);
  }

// context: (context),builder: (context)
  static  dialogBoite(
    context,
    onPressed(),
    titleDialog,
    contentDialog,
    cancel,
    save,
  ) {
  return  showDialog(
        context: (context),
        builder: (context) {
          return SimpleDialog(
            title: Text(titleDialog,
                style: Utils.boldText(), textAlign: TextAlign.center),
            children: [
              Container(
                padding:
                    const EdgeInsets.only(top: 0, left: 5, bottom: 5, right: 5),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Text(contentDialog,
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
                              cancel,
                              style: const TextStyle(
                                  fontFamily: 'JetBrain', color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 110,
                          child: ElevatedButton(
                            onPressed: (()=>onPressed()),
                            // () {
                            //   Navigator.of(context).pop();
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               const HomePage()));
                            // },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                            child:  Text(
                              save,
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
  }
}
