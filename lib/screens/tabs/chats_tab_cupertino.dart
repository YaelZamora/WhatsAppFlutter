import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/helpers.dart';

class ChatTabCupertino extends StatelessWidget {
  const ChatTabCupertino({
    Key? key,
    required TextEditingController textEditingController,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            leading: const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Editar',
                style: TextStyle(color: CupertinoColors.activeBlue),
              ),
            ),
            trailing: CupertinoButton(
              child: const Icon(CupertinoIcons.square),
              onPressed: () {},
            ),
            largeTitle: const Text(
              'Chats',
            ),
            border: const Border(bottom: BorderSide.none),
            backgroundColor: Colors.white,
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CupertinoSearchTextField(
                    controller: _textEditingController,
                    placeholder: 'Buscar',
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return CupertinoListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 58, 165, 99),
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/id/${index + 300}/30'),
                        ),
                        title: Text(
                          nombres.elementAt(index),
                        ),
                        subtitle: (leidos.elementAt(index)
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.done_all,
                                    color: (leidos.elementAt(index)
                                        ? Colors.blue
                                        : Colors.transparent),
                                    size: 15,
                                  ),
                                  Text(
                                    mensajes.elementAt(index),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              )
                            : Text(
                                mensajes.elementAt(index),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )),
                        trailing: SizedBox(
                          width: 30,
                          height: 50,
                          child: Column(
                            children: [
                              const Text(
                                'Ayer',
                                style: TextStyle(fontSize: 10),
                              ),
                              const SizedBox(height: 15),
                              (leidos.elementAt(index)
                                  ? const SizedBox()
                                  : const CircleAvatar(
                                      radius: 10,
                                      backgroundColor:
                                          Color.fromARGB(255, 58, 165, 99),
                                    ))
                            ],
                          ),
                        ),
                        onTap: () {},
                      );
                    },
                    itemCount: 20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
