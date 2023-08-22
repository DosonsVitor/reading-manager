import 'package:flutter/material.dart';
import 'package:reading_manager/application/ui/pages/initial_page.dart';
import 'package:reading_manager/application/ui/style.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: ThemeMode.system,
      initialRoute: InitialPage.route,
      routes: {
        InitialPage.route: (context) => const InitialPage(),
      },
    );
  }
}