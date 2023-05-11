import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EstadosTabCupertino extends StatelessWidget {
  const EstadosTabCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            leading: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Editar',
                style: TextStyle(color: CupertinoColors.activeBlue),
              ),
            ),
            largeTitle: Text('Estados'),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Container(
                  height: 25,
                  width: double.infinity,
                  color: CupertinoColors.systemGrey5,
                ),
                CupertinoListTile(
                  border: const Border(
                    top: BorderSide(color: CupertinoColors.systemGrey4),
                    bottom: BorderSide(color: CupertinoColors.systemGrey4),
                  ),
                  leading: CircleAvatar(),
                  title: const Text(
                    'Mi estado',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: const Text(
                    'Añadir a mi estado',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey2,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  trailing: SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CupertinoButton(
                          borderRadius: BorderRadius.circular(30),
                          padding: EdgeInsets.all(1),
                          color: CupertinoColors.systemGrey5,
                          child: const Icon(
                            CupertinoIcons.camera_fill,
                            color: CupertinoColors.activeBlue,
                          ),
                          onPressed: () {},
                        ),
                        CupertinoButton(
                          borderRadius: BorderRadius.circular(30),
                          padding: EdgeInsets.all(1),
                          color: CupertinoColors.systemGrey5,
                          child: const Icon(
                            CupertinoIcons.pencil,
                            color: CupertinoColors.activeBlue,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: double.infinity,
                  color: CupertinoColors.systemGrey5,
                ),
                Container(
                  height: 70,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: CupertinoColors.white,
                    border: Border(
                      top: BorderSide(color: CupertinoColors.systemGrey4),
                      bottom: BorderSide(color: CupertinoColors.systemGrey4),
                    ),
                  ),
                  child: const Text(
                    'No hay actualizaciones\nrecientes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: CupertinoColors.systemGrey2,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: CupertinoColors.systemGrey5,
                    alignment: Alignment.topCenter,
                    child: CupertinoButton(
                      child: const Text(
                        'Tus actualizaciones de estado\nestán cifradas de extremo a\nextremo',
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
