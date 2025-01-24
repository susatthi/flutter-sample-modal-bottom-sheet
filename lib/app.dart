import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'feature/home/ui/home_page.dart';
import 'theme/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lightThemeData =
        ref.watch(themeDataProvider(brightness: Brightness.light));
    return MaterialApp(
      title: 'modal_bottom_sheet sample',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialWithModalsPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      },
    );
  }
}
