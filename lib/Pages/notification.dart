import 'package:flutter/material.dart';

class NotifPage extends StatefulWidget {
  const NotifPage({super.key});

  @override
  State<NotifPage> createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification",style: TextStyle(fontFamily: 'JetBrain'),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
    );
  }
}