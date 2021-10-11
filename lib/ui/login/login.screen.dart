import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _textEditingController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _textEditingController,
        ),
        TextField(
          controller: _textEditingController,
        ),
        ElevatedButton(onPressed: (){print('i pressed');},child:Text('Login'))
      ],
    );
  }
}
