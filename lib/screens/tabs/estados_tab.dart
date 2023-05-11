import 'package:flutter/material.dart';
import 'package:whatsapp/helpers.dart';
import 'package:whatsapp/screens/home_cupertino.dart';

class EstadosTab extends StatelessWidget {
  const EstadosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Estados(
                  leading: Estado(
                    borde: Colors.green.shade700,
                    imagen: 'https://picsum.photos/id/20/30',
                  ),
                  title: const Text('Mi estado'),
                  subtitle: const Text('Ayer a las 10:45 p. m.'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  ),
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
                  height: 320,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) => Estados(
                      leading: Estado(
                        borde: Colors.green.shade700,
                        imagen: 'https://picsum.photos/id/${index + 300}/30',
                      ),
                      title: Text(
                        nombres.elementAt(index),
                      ),
                      subtitle: const Text('Hoy a las 7:45 a. m.'),
                    ),
                    itemCount: 5,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Vistos',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 320,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) => Estados(
                      leading: Estado(
                          borde: Colors.grey,
                          imagen: 'https://picsum.photos/id/${index + 305}/30'),
                      title: Text(
                        nombres.elementAt(index + 5),
                      ),
                      subtitle: const Text('Hoy a las 7:25 a. m.'),
                    ),
                    itemCount: 5,
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
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 85,
          right: 22,
          child: FloatingActionButton(
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.grey,
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class Estado extends StatelessWidget {
  const Estado({
    Key? key,
    required this.borde,
    required this.imagen,
  }) : super(key: key);

  final Color borde;
  final String imagen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border(
          top: BorderSide(
            width: 2,
            color: borde,
          ),
          bottom: BorderSide(
            width: 2,
            color: borde,
          ),
          left: BorderSide(
            width: 2,
            color: borde,
          ),
          right: BorderSide(
            width: 2,
            color: borde,
          ),
        ),
        image: DecorationImage(
          image: NetworkImage(
            imagen,
          ),
        ),
      ),
    );
  }
}

class Estados extends StatelessWidget {
  const Estados({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.trailing = const SizedBox(),
  }) : super(key: key);

  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
    );
  }
}
