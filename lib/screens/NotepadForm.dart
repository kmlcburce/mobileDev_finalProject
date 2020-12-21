import 'package:flutter/material.dart';

//no backend yet

class Noteform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        TextFormField(
          //controller here
          decoration: const InputDecoration(
              hintText: 'Add a title', labelText: 'title'),
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter a title";
            }
            return "Text Please";
          },
        ),
        TextFormField(
          //controller here
          decoration:
              const InputDecoration(hintText: 'Add Text', labelText: 'text'),
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter a text";
            }
            return "Text Please";
          },
        ),
        RaisedButton(
          child: Text('Submit'),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
