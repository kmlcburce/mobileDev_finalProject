import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotepadScreen extends StatefulWidget {
  @override
  _NotepadScreenState createState() => _NotepadScreenState();
}

class _NotepadScreenState extends State<NotepadScreen> {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Note Title or smth"),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(15),
                child: new NoteFormFieldBuilder(),
              )),
        ));
  }
}

class NoteFormFieldBuilder extends StatelessWidget {
  NoteFormFieldBuilder();

  @override
  Widget build(BuildContext context) {
    //final note = Provider.of<NoteModel>(context, listen: false).getActiveNotes;

    String title; //= note?.title ?? "";
    String message; // = note?.message ?? "";

    final titleController = TextEditingController(text: title);
    final messageController = TextEditingController(text: message);

    return Column(
      children: <Widget>[
        TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
                hintText: 'Title Here', labelText: 'Title'),
            validator: (value) {
              if (value.isEmpty) {
                return "Enter text here";
              }
              return "Text here please";
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

            bool isCreating; //= (note?.id == null);

            if (isCreating) {
              //notesModel.createNewNote({"title": title, "message": message});
            } else {
              /*
              Notes activeNotes =
                  Provider.of<NoteModel>(context, listen: false).getActiveNotes;

              activeNotes.title = title;
              activeNotes.message = message;

              await Provider.of<NoteModel>(context, listen: false)
                  .saveActiveNoteEdits();
              */
            }

            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
