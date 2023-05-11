import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp/helpers.dart';
import 'package:whatsapp/screens/home_cupertino.dart';

// ignore: must_be_immutable
class LlamadasTab extends StatelessWidget {
  LlamadasTab({super.key});

  Random random = Random();
  Random dia = Random();
  Random mes = Random();
  Random year = Random();

  int min = 2020;
  int max = 2023;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 58, 165, 99),
                    child: Icon(
                      Icons.link,
                      color: Colors.white,
                    ),
                  ),
                  title: Text('Crear enlace de llamada'),
                  subtitle: Text('Comparte un enlace para tu llamada'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Recientes',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 550,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      bool randomNumber = random.nextBool();
                      int newDia = dia.nextInt(28) + 1;
                      int newMes = mes.nextInt(12) + 1;
                      int newYear = min + year.nextInt((max + 1) - min);

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 58, 165, 99),
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/id/${index + 300}/30',
                          ),
                        ),
                        title: Text(
                          nombres.elementAt(index),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              (randomNumber
                                  ? Icons.call_made
                                  : Icons.call_received),
                              color: (randomNumber ? Colors.green : Colors.red),
                              size: 15,
                            ),
                            Text(
                              '$newDia/$newMes/$newYear ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        trailing: (randomNumber
                            ? const Icon(
                                Icons.call,
                                color: Color.fromARGB(255, 58, 165, 99),
                              )
                            : const Icon(
                                Icons.video_call,
                                color: Color.fromARGB(255, 58, 165, 99),
                              )),
                      );
                    },
                    itemCount: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color.fromARGB(255, 58, 165, 99),
            child: const Icon(
              Icons.add_call,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
