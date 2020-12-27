import 'package:final_project/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:final_project/components/AuthenticationService.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email;
  String password;
  String cpassword;

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
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        email = value;
      },
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
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) {
        password = value;
      },
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
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) {
        cpassword = value;
      },
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
        onPressed: () async {
          context.read<AuthenticationService>().signUp(
                email: email,
                password: password,
              );
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
