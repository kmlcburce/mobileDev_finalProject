import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project/components/AuthenticationService.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpasswordController = TextEditingController();

  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Register"),
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
                  cPasswordField(),
                  SizedBox(
                    height: 20.0,
                  ),
                  submitButton(),
                  SizedBox(
                    height: 20.0,
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

  TextFormField cPasswordField() {
    return TextFormField(
      controller: cpasswordController,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Container(
          child: Icon(Icons.lock),
        ),
        labelText: "Confirm Password",
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
        onPressed: () {
          if (cpasswordController.text == passwordController.text) {
            context.read<AuthenticationService>().signUp(
                email: emailController.text, password: passwordController.text);
          } else {
            return "Incorrect input of password/confirmed password";
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 10.0,
            ),
            Text("Register"),
          ],
        ),
      ),
    );
  }
}
