import 'package:flutter/material.dart';

class AuthFormWidget extends StatefulWidget {
  final Function() onPressSubmit;
  final String submitButtonText;

  const AuthFormWidget(
      {super.key, required this.onPressSubmit, required this.submitButtonText});

  @override
  State<StatefulWidget> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
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
                onPressed: widget.onPressSubmit,
                child: Text(widget.submitButtonText))
          ],
        ));
  }
}
