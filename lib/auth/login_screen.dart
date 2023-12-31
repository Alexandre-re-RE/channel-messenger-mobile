import 'dart:convert';

import 'package:channel_messenger_mobile/app/chat_screen.dart';
import 'package:channel_messenger_mobile/messenger_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../components/primary_button.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscureText = true;
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  @override
  void dispose() {
    _emailInputController.dispose();
    _passwordInputController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    setState(() {
      _emailInputController.text = "webmaster@alexandre.re";
      _passwordInputController.text = "alexandre";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              const Text(
                "Channel Messenger",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
              ),
              Image.network(
                "https://i.pinimg.com/originals/5f/8c/cf/5f8ccf30ad5706df5f316f23f0b3d16b.png",
                height: 146,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("E-mail"),
              ),
              TextField(
                controller: _emailInputController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'e-mail',
                ),
              ),
              Container(margin: EdgeInsets.only(top: 20)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Mot de passe"),
              ),
              TextField(
                controller: _passwordInputController,
                obscureText: _isObscureText,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'mot de passe',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    color: Colors.black,
                    onPressed: () {
                      setState(() {
                        _isObscureText = !_isObscureText;
                      });
                    },
                  ),
                ),
              ),
              Container(margin: EdgeInsets.only(top: 20)),
              PrimaryButton(
                text: "Se connecter",
                press: () async {
                  bool isAuth = await login(
                      email: _emailInputController.text,
                      password: _passwordInputController.text);

                  if (isAuth) {
                    final box = GetStorage();
                    box.write('email', _emailInputController.text);
                    box.write('password', _passwordInputController.text);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => ChatScreen()));
                  }
                },
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
