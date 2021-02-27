import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              color: Colors.blue,
              width: 100.0,
              height: 100.0,
              child: Text('logo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              )
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
              child: emailField(),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0, bottom: 20.0),
              child: passwordField(),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 30.0),
              height: 50.0,
              width: double.infinity,
              child: submitButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'you@exmaple.com',
      ),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Sign In',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        )
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('time to pose $email and $password to my API');
        }
      },
    );
  }
}

class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 6) {
      return 'Enter 6 more char';
    }
    return null;
  }
}
