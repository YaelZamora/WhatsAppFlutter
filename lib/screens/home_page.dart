import 'package:flutter/material.dart';
import 'package:whatsapp/screens/tabs/tabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Chats'),
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: Text(
                      '8',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Estados'),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Llamadas'),
            ),
          ],
          indicatorWeight: 5,
          indicatorColor: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 58, 165, 99),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const ChatTab(),
          const EstadosTab(),
          LlamadasTab(),
        ],
      ),
    );
  }
}
