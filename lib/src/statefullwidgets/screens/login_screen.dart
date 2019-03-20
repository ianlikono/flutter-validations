import 'package:flutter/material.dart';

import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget _emailField() {
    return TextFormField(
      validator: validateEmail,
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(labelText: 'Email Address', hintText: 'john@doe.com'),
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      validator: validatePassword,
      obscureText: true,
      decoration:
          InputDecoration(labelText: 'Password', hintText: 'Enter Password'),
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget _submitButton() {
    return RaisedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'Ready Boys Email is $email Paswword $password , Take me to a safe place');
        }
      },
      child: Text('Submit'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            _emailField(),
            _passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            _submitButton(),
          ],
        ),
      ),
    );
  }
}
