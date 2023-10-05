import 'package:channel_messenger_mobile/app/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/message_screen.dart';
import 'auth/login_screen.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Application',
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kContentColorLightTheme,
        appBarTheme:
            appBarTheme.copyWith(backgroundColor: kContentColorLightTheme),
        iconTheme: const IconThemeData(color: kContentColorDarkTheme),
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: kContentColorDarkTheme),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
          error: kErrorColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: kContentColorLightTheme,
          selectedItemColor: Colors.white70,
          unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
          selectedIconTheme: const IconThemeData(color: kPrimaryColor),
          showUnselectedLabels: true,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    if (box.hasData("email") && box.hasData("password")) {
      return ChatScreen();
    }
    return LoginScreen();
  }
}
