import 'dart:math';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/helpers.dart';

enum Sky { todas, perdidas }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.todas: CupertinoColors.activeBlue,
  Sky.perdidas: CupertinoColors.activeBlue,
};

class LlamadasTabCupertino extends StatefulWidget {
  const LlamadasTabCupertino({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  State<LlamadasTabCupertino> createState() => _LlamadasTabCupertinoState();
}

class _LlamadasTabCupertinoState extends State<LlamadasTabCupertino> {
  Sky _selectedSegment = Sky.todas;

  Random random = Random();
  Random dia = Random();
  Random mes = Random();
  Random year = Random();

  int min = 2020;
  int max = 2023;

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
            middle: CupertinoSegmentedControl<Sky>(
              selectedColor: skyColors[_selectedSegment],
              padding: const EdgeInsets.symmetric(horizontal: 12),
              groupValue: _selectedSegment,
              onValueChanged: (Sky value) {
                setState(() {
                  _selectedSegment = value;
                });
              },
              children: const <Sky, Widget>{
                Sky.todas: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Todas',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                Sky.perdidas: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Perdidas',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
              },
            ),
            trailing: CupertinoButton(
              child: const Icon(CupertinoIcons.phone_badge_plus),
              onPressed: () {},
            ),
            largeTitle: const Text(
              'Llamadas',
            ),
            border: const Border(bottom: BorderSide.none),
            backgroundColor: CupertinoColors.white,
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CupertinoSearchTextField(
                    controller: widget.textEditingController,
                    placeholder: 'Buscar',
                  ),
                ),
                const CupertinoListTile(
                  leading: CircleAvatar(
                    backgroundColor: CupertinoColors.systemGrey5,
                    child: Icon(
                      CupertinoIcons.link,
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                  title: Text('Crear enlace de llamada'),
                  subtitle: Text('Comparte un enlace para tu llamada'),
                ),
                SizedBox(
                  height: 450,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      bool randomNumber = random.nextBool();
                      int newDia = dia.nextInt(28) + 1;
                      int newMes = mes.nextInt(12) + 1;
                      int newYear = min + year.nextInt((max + 1) - min);

                      return CupertinoListTile(
                        title: Text(
                          nombres.elementAt(index),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              CupertinoIcons.phone_fill,
                              color: (randomNumber
                                  ? CupertinoColors.systemGrey5
                                  : CupertinoColors.systemRed),
                              size: 15,
                            ),
                            Text(
                              '$newDia/$newMes/$newYear ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        trailing: CupertinoButton(
                          child: const Icon(CupertinoIcons.info),
                          onPressed: () {},
                        ),
                      );
                    },
                    itemCount: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
