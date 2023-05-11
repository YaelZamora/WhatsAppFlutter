import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp/helpers.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key, required this.indexRecibed});

  final int indexRecibed;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 58, 165, 99),
        leadingWidth: 85,
        leading: SizedBox(
          height: 30,
          width: 85,
          child: Row(
            children: [
              IconButton(
                onPressed: (() => Navigator.pop(context)),
                icon: Icon(Icons.chevron_left),
              ),
              Hero(
                tag: indexRecibed,
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 58, 165, 99),
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/id/${indexRecibed + 300}/30',
                  ),
                ),
              ),
            ],
          ),
        ),
        title: SizedBox(
          width: 250,
          child: Text(
            nombres.elementAt(indexRecibed),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.95,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/id/29/370/720'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: size.height * 0.85,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                bool randomMessage = random.nextBool();

                return BubbleChat(isYou: randomMessage);
              },
              reverse: true,
              itemCount: 30,
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NewMessage(size: size),
                  FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 58, 165, 99),
                    mini: true,
                    child: const Icon(
                      Icons.mic,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewMessage extends StatelessWidget {
  const NewMessage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: 45,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(22, 22, 22, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.emoji_emotions,
              color: Color.fromARGB(255, 156, 156, 156),
            ),
          ),
          const SizedBox(
            width: 150,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Mensaje',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.attachment,
              color: Color.fromARGB(255, 156, 156, 156),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt,
              color: Color.fromARGB(255, 156, 156, 156),
            ),
          ),
        ],
      ),
    );
  }
}

class BubbleChat extends StatelessWidget {
  const BubbleChat({
    Key? key,
    required this.isYou,
  }) : super(key: key);

  final bool isYou;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 150,
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: (isYou) ? 100 : 10,
        right: (isYou) ? 10 : 100,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: (isYou) ? Colors.green.shade300 : Colors.grey.shade800,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Text(
            'Aute irure magna quis reprehenderit in.\nAute irure magna quis reprehenderit in.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: (isYou) ? Colors.black : Colors.white,
            ),
          ),
          Positioned(
            bottom: 0,
            right: (isYou) ? 30 : 0,
            child: Text(
              '9:34am',
              style: TextStyle(
                fontSize: 10,
                color: (isYou) ? Colors.black : Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            child: (isYou)
                ? const Icon(
                    Icons.done_all,
                    color: Colors.lightBlue,
                    size: 15,
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
/**/