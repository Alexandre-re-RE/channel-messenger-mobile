class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Media fun",
    lastMessage: "Hahahahahaah mdr le fou...",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNfIrJI4DCMnTxFNEDRRGTkRuBUPX8PFH0aQ&usqp=CAU",
    time: "3m",
    isActive: false,
  ),
  Chat(
    name: "Hardrole",
    lastMessage: "Bonjour c'est interdit! Je suis...",
    image:
        "https://creazilla-store.fra1.digitaloceanspaces.com/emojis/53259/no-one-under-eighteen-emoji-clipart-md.png",
    time: "8m",
    isActive: true,
  ),
  Chat(
    name: "Révolution",
    lastMessage: "Avez-vous des news...",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzhD2FoXUALJCVzgyz4hyOpkZLaaDlrgsiRQ&usqp=CAU",
    time: "5j",
    isActive: false,
  ),
];
