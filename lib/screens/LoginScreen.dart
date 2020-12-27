import 'package:final_project/components/AuthenticationService.dart';
import 'package:flutter/material.dart';
import './RegisterScreen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Login"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                  child: Column(
                children: [
                  emailField(),
                  SizedBox(
                    height: 20.0,
                  ),
                  passwordField(),
                  SizedBox(
                    height: 20.0,
                  ),
                  submitButton(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [newUserButton()],
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField emailField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Container(
          child: Icon(Icons.email),
        ),
        labelText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }

  TextFormField passwordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Container(
          child: Icon(Icons.lock),
        ),
        labelText: "Password",
        suffixIcon: GestureDetector(
          child: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }

  ButtonTheme submitButton() {
    return ButtonTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      height: 50.0,
      child: RaisedButton(
        onPressed: () async {
          context.read<AuthenticationService>().signIn(
                email: emailController.text,
                password: passwordController.text,
              );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 10.0,
            ),
            Text("Login"),
          ],
        ),
      ),
    );
  }

  FlatButton newUserButton() {
    return FlatButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RegisterScreen()));
        },
        child: Text("New User? Register here"));
  }
}
