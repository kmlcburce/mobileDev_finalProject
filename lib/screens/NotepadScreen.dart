import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './DashboardScreen.dart';

class NotepadScreen extends StatefulWidget {
  @override
  _NotepadScreenState createState() => _NotepadScreenState();
}

class _NotepadScreenState extends State<NotepadScreen> {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    Navigator.pop(
      context,
      DashboardScreen(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Note Title or smth"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: TextField(),
        ),
      ),
    );
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

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: ConstrainedBox(
              constraints: new BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth),
            ),
          );
        },
      ),
    );
  }
}
