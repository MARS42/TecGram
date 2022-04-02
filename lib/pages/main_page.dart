import 'package:flutter/material.dart';
import 'package:tecgram_app/pages/home/account_view.dart';
import 'package:tecgram_app/session/session.dart';

/// Página principal de la aplicación
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  dynamic session;
  int _viewIndex = 0;
  late TabController tabController;

  void cambiarVista(int i) {
    setState(() {
      _viewIndex = i;
      tabController.index = i;
    });
  }

  final List<Widget> _vistas = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    session = ModalRoute.of(context)!.settings.arguments;

    _vistas.add(Text("Inicio"));
    _vistas.add(Text("Buscar"));
    _vistas.add(AccountView(session: session));

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
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_outline_rounded),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.mail_outlined),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              )),
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
      floatingActionButton: _viewIndex == 0
          ? FloatingActionButton(
              child: const Icon(Icons.post_add),
              onPressed: () {},
              tooltip: "Nuevo post",
            )
          : null,
    );
  }
}
