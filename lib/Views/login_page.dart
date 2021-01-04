import 'package:flutter/material.dart';
import 'package:potres2020v2/Widgets/my_scaffold.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bottomNavBarCurrentIndex: 2,
      title: 'Prijava',
      children: [
        Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              TextFormField(decoration: InputDecoration(labelText: 'Mail'),),
              TextFormField(decoration: InputDecoration(labelText: 'Lozinka'),),
              SizedBox(height: 24),
              RaisedButton(child: Text('PRIJAVI SE'), onPressed: () {
                // todo
              },),
            ],),
          ),
        )
      ],
    );
  }
}
