import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/tabs/estados_tab_cupertino.dart';
import 'package:whatsapp/screens/tabs/llamadas_tab_cupertino.dart';

import 'tabs/chats_tab_cupertino.dart';

class HomeCupertino extends StatefulWidget {
  const HomeCupertino({super.key});

  @override
  State<HomeCupertino> createState() => _HomeCupertinoState();
}

class _HomeCupertinoState extends State<HomeCupertino> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      EstadosTabCupertino(),
      LlamadasTabCupertino(textEditingController: _textEditingController),
      Center(
        child: Text('Estas'),
      ),
      ChatTabCupertino(textEditingController: _textEditingController),
      Center(
        child: Text('Puto el que lo lea'),
      ),
    ];

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 3,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.capsule),
            label: 'Estados',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: 'Llamadas',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.camera),
            label: 'Cámara',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2_fill),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Configuración',
          ),
        ],
      ),
      tabBuilder: ((context, index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return items[index];
          },
        );
      }),
    );
  }
}
