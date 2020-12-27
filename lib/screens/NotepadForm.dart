import 'package:final_project/Models/Note.dart';
import 'package:final_project/Models/Note_dao.dart';
import 'package:flutter/material.dart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notepad')),
      body: SingleChildScrollView(
          child: Form(
  
              child: Container(
                padding: EdgeInsets.all(15),
                child:
                    new NoteFormFieldBuilder(), //context seems to be automatically inherited/handled to a child widget)
              ))),
    );
  }
}

class NoteFormFieldBuilder extends StatelessWidget {
  NoteFormFieldBuilder();

  @override
  Widget build(BuildContext context) {
    //final note = Provider.of<NoteModel>(context, listen: false).getActiveNotes;
    
    //String title = note?.title ?? "";
    //String message = note?.message ?? "";

    //final titleController = TextEditingController(text: title);
    //final messageController = TextEditingController(text: message);

    return Column(
      children: <Widget>[
        TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
                hintText: 'Add a title', labelText: 'Title'),
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter some text";
              }
              return "Text please";
            }),
        TextFormField(
          controller: messageController,
          decoration: const InputDecoration(
              hintText: 'Talk about something!', labelText: 'Message'),
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter some text";
            }
            return null;
          },
          maxLines: null,
          keyboardType: TextInputType.multiline,
        ),
        RaisedButton(
          child: Text('Submit'),
          onPressed: () async {
            //final notesModel = context.read<NoteModel>();

            String title = titleController.text;
            String message = messageController.text;

            bool isCreating = (note?.id == null);

            if (isCreating) {
              notesModel.createNewNote({"title": title, "message": message});
            } else {
              /*
              Notes activeNotes =
                  Provider.of<NoteModel>(context, listen: false).getActiveNotes;
              
              activeNotes.title = title;
              activeNotes.message = message;
              /*
              await Provider.of<NoteModel>(context, listen: false)
                  .saveActiveNoteEdits();
              S*/
            }

            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
