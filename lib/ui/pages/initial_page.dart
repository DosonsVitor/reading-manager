import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class InitialPage extends StatefulWidget{
  const InitialPage({super.key});
  static String route = "/";

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>{
  final List<Widget> _widgetOptions = [
    const Text("Inicio"),
    const Text("Lista de leitura"),
    const Text("Lendo"),
    const Text("Lidos"),
    const Text("Pesquisar"),
  ];
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estante Virtual"),
      ),
      body: Center(
        child: _widgetOptions[_bottomNavIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => setState(() => _bottomNavIndex = 4),
        shape: const CircleBorder(),
        backgroundColor: _bottomNavIndex == 4
            ? Theme.of(context).primaryColorLight
            : Theme.of(context).floatingActionButtonTheme.backgroundColor,
        child: const Icon(Typicons.zoom_in),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        gapLocation: GapLocation.center,
        leftCornerRadius: 30,
        rightCornerRadius: 30,
        backgroundColor: Theme.of(context).colorScheme.surface,
        activeColor: Theme.of(context).primaryColorLight,
        icons: const [
          Typicons.home,
          Typicons.th_list,
          Typicons.eye,
          Typicons.input_checked,
        ],
        activeIndex: _bottomNavIndex,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}