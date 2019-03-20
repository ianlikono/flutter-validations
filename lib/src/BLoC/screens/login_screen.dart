import 'package:flutter/material.dart';

import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget _emailField(Bloc bloc) {
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

  Widget _paswwordField(Bloc bloc) {
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

  Widget _submitPassword(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (BuildContext context, snapshot) {
        return RaisedButton(
          child: Text('Submit'),
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          _emailField(bloc),
          _paswwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 10.0),
          ),
          _submitPassword(bloc),
        ],
      ),
    );
  }
}
