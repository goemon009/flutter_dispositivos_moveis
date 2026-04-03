import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard/pages/dashboard_page.dart';
import 'package:flutter_application_1/estoques/pages/estoque_page.dart';
import 'package:flutter_application_1/insumos/pages/insumos_list.dart';
import 'package:flutter_application_1/usuarios/pages/usuario_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: [
          DashboardPage(),
          InsumosListPage(),
          EstoquePage(),
          UsuarioPage(),
        ][_index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (value) {
            setState(() {
              _index = value;
            });
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            NavigationDestination(icon: Icon(Icons.list_alt), label: 'Insumos'),
            NavigationDestination(icon: Icon(Icons.store), label: 'Estoque'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          elevation: 1,
          title: Text('Controle de Insumos'),
          actions: [
            IconButton(
              onPressed: () {
                debugPrint('Clique no botão ao lado');
              },
              icon: Icon(Icons.person),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag)),
          ],
        ),
      ),
    );
  }
}
