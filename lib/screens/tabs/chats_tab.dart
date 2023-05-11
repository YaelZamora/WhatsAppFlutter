import 'package:flutter/material.dart';
import 'package:whatsapp/helpers.dart';
import 'package:whatsapp/screens/chat_page.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          ListView.separated(
            itemBuilder: (BuildContext context, int index) => ListTile(
              leading: Hero(
                tag: index,
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 58, 165, 99),
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/id/${index + 300}/30',
                  ),
                ),
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
                    Text(
                      'Ayer',
                      style: TextStyle(
                        color: (leidos.elementAt(index)
                            ? Colors.black
                            : const Color.fromARGB(255, 58, 165, 99)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    (leidos.elementAt(index)
                        ? const SizedBox()
                        : const CircleAvatar(
                            radius: 10,
                            backgroundColor: Color.fromARGB(255, 58, 165, 99),
                          ))
                  ],
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ChatPage(
                    indexRecibed: index,
                  ),
                ),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              endIndent: 20,
              indent: 55,
            ),
            itemCount: 20,
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color.fromARGB(255, 58, 165, 99),
              child: const Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
