import 'package:flutter/material.dart';
import 'package:potres2020v2/Models/login/login_request.dart';
import 'package:potres2020v2/Widgets/my_scaffold.dart';
import 'package:potres2020v2/api/api_service.dart';
import 'package:potres2020v2/manager/user_manager.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bottomNavBarCurrentIndex: 2,
      title: 'Prijava',
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (UserManager.instance.token != null && UserManager.instance.username != null) _CurrentUser(),
                TextFormField(decoration: InputDecoration(labelText: 'Mail'), controller: _mailController),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Lozinka'),
                  controller: _passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 24),
                if (isLoading)
                  Center(child: CircularProgressIndicator())
                else
                  RaisedButton(
                    child: Text('PRIJAVI SE'),
                    onPressed: () {
                      _onLoginPressed(context);
                    },
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _onLoginPressed(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      try {
        setState(() => isLoading = true);
        final t = await ApiService.login(
            LoginRequest.fromCredentials(_mailController.text.trim(), _passwordController.text.trim()));
        // save token
        UserManager.instance.token = t;
        UserManager.instance.username = _mailController.text.trim();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Prijava uspješna'),
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login nije uspio. Provjerite unos i pokušajte ponovno.'),
        ));
      } finally {
        setState(() => isLoading = false);
      }
    }
  }
}

class _CurrentUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.person_rounded),
        title: Text(
          'Prijavljen kao: ${UserManager.instance.username}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
