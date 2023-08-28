import 'package:flutter/material.dart';

enum AuthType {
  signin('サインイン'),
  signup('サインアップ'),
  ;

  final String label;
  const AuthType(this.label);
}

class AuthFormWidget extends StatefulWidget {
  final Function(String email, String password) onPressSubmit;
  final AuthType authType;

  const AuthFormWidget(
      {super.key, required this.onPressSubmit, required this.authType});

  @override
  State<StatefulWidget> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _onPressSubmit() {
    if (_formKey.currentState!.validate()) {
      final snackString = "..${widget.authType.label}中";
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(snackString)));
      widget.onPressSubmit(emailController.text, passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              autocorrect: false,
              decoration: const InputDecoration(labelText: "メールアドレス"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "メールアドレスを入力してください";
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              autocorrect: false,
              decoration: const InputDecoration(labelText: "パスワード"),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "パスワードを入力してください";
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: _onPressSubmit, child: Text(widget.authType.label))
          ],
        ));
  }
}
