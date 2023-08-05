import 'package:flutter/material.dart';
import 'package:reading_manager/ui/pages/initial_page.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: InitialPage.route,
      routes: {
        InitialPage.route: (context) => const InitialPage(),
      },
    );
  }


}