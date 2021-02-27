import 'package:first_flutter_app/src/random_list.dart';
import 'package:first_flutter_app/src/signIn.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> with ValidationMixin {
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
                margin: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  '회원가입',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )),
            Container(
              margin: EdgeInsets.only(
                  left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
              child: emailField(),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 50.0, right: 50.0, top: 10.0, bottom: 20.0),
              child: passwordField(),
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
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
      child: Text('회원가입 완료',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SignIn(),
          )).then((value) {
            setState(() {});
          });
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
