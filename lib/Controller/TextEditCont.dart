import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  //creates a custom Form
  @override
  CustomForm createState() => CustomForm();
}

class CustomForm extends State<MyCustomForm> {
  final myController = TextEditingController();

  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {}
}
