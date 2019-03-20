import 'package:flutter/material.dart';

import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  Widget _emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'john@doe.com',
            labelText: 'Email Adress',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget _paswwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (BuildContext context, snapshot) {
        return (TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Paswword',
              labelText: 'Paswword',
              errorText: snapshot.error),
        ));
      },
    );
  }

  Widget _submitPassword() {
    return RaisedButton(
      child: Text('Submit'),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          _emailField(),
          _paswwordField(),
          Container(
            margin: EdgeInsets.only(top: 10.0),
          ),
          _submitPassword(),
        ],
      ),
    );
  }
}
