import 'package:flutter/material.dart';

import '../components/chat_input_field.dart';
import '../components/message.dart';
import '../constants.dart';
import '../models/ChatMessage.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ListView.builder(
                itemCount: demeChatMessages.length,
                itemBuilder: (context, index) =>
                    Message(message: demeChatMessages[index]),
              ),
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNfIrJI4DCMnTxFNEDRRGTkRuBUPX8PFH0aQ&usqp=CAU"),
          ),
          const SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Media fun",
                style: TextStyle(fontSize: 16),
              ),
            ],
          )
        ],
      ),
      actions: [
        PopupMenuButton<dynamic>(
          position: PopupMenuPosition.under,
          child: Icon(Icons.settings),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<dynamic>>[
            const PopupMenuItem<dynamic>(
              value: 0,
              child: Text('Se désabonner'),
            ),
            const PopupMenuItem<dynamic>(
              value: 1,
              child: Text('Mettre à jour'),
            ),
            const PopupMenuItem<dynamic>(
              value: 2,
              child: Text('Supprimer'),
            ),
          ],
        ),
        const SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
