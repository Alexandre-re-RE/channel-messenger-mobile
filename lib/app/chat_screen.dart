import 'package:channel_messenger_mobile/app/profile_screen.dart';
import 'package:flutter/material.dart';

import '../components/chat_card.dart';
import '../components/filled_outline_button.dart';
import '../constants.dart';
import '../models/Chat.dart';
import 'message_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(
                kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
            color: kPrimaryColor,
            child: Row(
              children: [
                FillOutlineButton(press: () {}, text: "Message récent"),
                const SizedBox(width: kDefaultPadding),
                FillOutlineButton(
                  press: () {},
                  text: "Mes channels",
                  isFilled: false,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) => ChatCard(
                chat: chatsData[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessagesScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      automaticallyImplyLeading: false,
      title: const Text("Channel Messenger"),
      actions: [
        GestureDetector(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQEFeDdAxTDdgREef2_eFcY5CGa-cZaWgXwfvUhW6T6oLO-byb7"),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const ProfileScreen()));
          },
        )
      ],
    );
  }
}
