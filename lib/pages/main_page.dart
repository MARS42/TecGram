import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecgram_app/pages/home/account_view.dart';
import 'package:tecgram_app/pages/home/messages_view.dart';
import 'package:tecgram_app/pages/home/homepage.dart';
import 'package:tecgram_app/pages/home/upload.dart';
import 'package:tecgram_app/pages/home/search.dart';

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
      tabController.animateTo(i, curve: Curves.elasticIn);
    });
  }

  final List<dynamic> _vistas = [];
  final List<Widget> _vistasFrags = [];
  final List<BottomNavigationBarItem> _vistasBtns = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    session = ModalRoute.of(context)!.settings.arguments;

    _vistas.add(["Inicio", Icon(CupertinoIcons.home), HomeTab()]);
    _vistas.add(["Mensajes", Icon(CupertinoIcons.chat_bubble), MessagesPage()]);
    _vistas.add(["Añadir", Icon(CupertinoIcons.add_circled), upload()]);
    _vistas.add(["Buscar", Icon(CupertinoIcons.search), Search()]);

    _vistas.add(
        ["Perfil", Icon(CupertinoIcons.person), AccountView(session: session)]);

    for (var i = 0; i < _vistas.length; i++) {
      _vistasBtns.add(
          BottomNavigationBarItem(icon: (_vistas[i][1]), label: _vistas[i][0]));
      _vistasFrags.add(_vistas[i][2]);
    }

    tabController = TabController(
      initialIndex: 0,
      length: _vistas.length,
      vsync: this,
    );

    tabController.animation?.addListener(() {
      // num diff = (tabController.index - tabController.animation!.value).abs();
      //
      // if(diff > 0.5) {
      //   setState(() {
      //     _viewIndex = tabController.animation!.value.round();
      //   });
      // }
      if (tabController.indexIsChanging) {
        setState(() {
          _viewIndex = tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Tecgram",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black),
              onPressed: () {},
            ),
          ]),
      body: TabBarView(
        controller: tabController,
        children: _vistasFrags,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _vistasBtns,
        currentIndex: _viewIndex,
        selectedItemColor: Colors.indigo,
        backgroundColor: Colors.indigo,
        unselectedItemColor: Colors.black45,
        onTap: cambiarVista,
      ),
      floatingActionButton: _viewIndex == 1
          ? FloatingActionButton(
              child: const Icon(Icons.post_add),
              onPressed: () {},
              tooltip: "Nuevo post",
            )
          : null,
    );
  }
}
