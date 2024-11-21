import 'package:flutter/material.dart';

import 'core/theme/theme_config.dart';
import 'features/home/presentation/page/home_page.dart';

class SquadApp extends StatelessWidget {
  const SquadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Squad OMDB',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomePage(),
      },
    );
  }
}
