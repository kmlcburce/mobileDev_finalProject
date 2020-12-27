import 'package:flutter/cupertino.dart';
import 'package:final_project/Models/Note.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyNote extends StatelessWidget {
  MyNote();

  Widget build(BuildContext context) {
    //final note = Provider.of<NoteModel>(context, listen: false).getActiveNotes;

    return Scaffold(
        appBar: AppBar(
          title: Text(
              //note title here,
              //note.title,
              "maxLines: 1,",
              overflow: TextOverflow.ellipsis),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
              padding: EdgeInsets.all(15),
              child: ConstrainedBox(
                constraints: new BoxConstraints(
                    minHeight: constraints.maxHeight,
                    minWidth: constraints.maxWidth),
                child: Text(
                    //maxLines: null,
                    "hello"),
              ));
        }));
  }
}
