import 'package:channel_messenger_mobile/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: kPrimaryColor,
    title: const Text("Profile"),
    actions: [
      IconButton(
          onPressed: () {
            final box = GetStorage();
            box.erase();
            Navigator.of(navigatorKey.currentContext!).pushReplacement(
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen()));
          },
          icon: Icon(Icons.logout_outlined)),
    ],
  );
}
