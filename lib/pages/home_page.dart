import 'package:flutter/material.dart';

/// Página principal de la aplicación
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _viewIndex = 0;
  late TabController tabController;

  void cambiarVista(int i) {
    setState(() {
      _viewIndex = i;
      tabController.index = i;
    });
  }

  static const List<Widget> _vistas = [
    Text("Inicio"),
    Text("Buscar"),
    Text("Perfil")
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: _vistas.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('Instituto Tecnológico de Cuautla'),
              pinned: true,
              floating: true,
              bottom: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Tecgram"),
                    Row(children: [
                      IconButton(icon: const Icon(Icons.favorite_outline_rounded), onPressed: () {},),
                      IconButton(icon: const Icon(Icons.mail_outlined), onPressed: () {},)
                    ],)
                    ],
                  )
                ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: _vistas,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: "Perfil"),
        ],
        currentIndex: _viewIndex,
        selectedItemColor: Colors.indigo,
        onTap: cambiarVista,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.post_add),
        onPressed: () {},
        tooltip: "Nuevo post",
      ),
    );
  }
}
