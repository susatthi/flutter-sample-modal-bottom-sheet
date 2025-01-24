import 'package:flutter/cupertino.dart';
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
      builder: (context, Widget? child) => CupertinoTheme(
        data: CupertinoThemeData(
          brightness: Theme.of(context).brightness,
          scaffoldBackgroundColor: CupertinoColors.systemBackground,
        ),
        child: child!,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialWithModalsPageRoute(
              builder: (_) => const HomePage(),
              settings: settings,
            );
        }
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: CupertinoScaffold(
              body: Builder(
                builder: (context) => CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    transitionBetweenRoutes: false,
                    middle: const Text('Normal Navigation Presentation'),
                    trailing: GestureDetector(
                      child: const Icon(Icons.arrow_upward),
                      onTap: () =>
                          CupertinoScaffold.showCupertinoModalBottomSheet<void>(
                        expand: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Stack(
                          children: <Widget>[
                            const ModalWithScroll(),
                            Positioned(
                              height: 40,
                              left: 40,
                              right: 40,
                              bottom: 20,
                              child: MaterialButton(
                                onPressed: () => Navigator.of(context).popUntil(
                                  (route) => route.settings.name == '/',
                                ),
                                child: const Text('Pop back home'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Container(),
                  ),
                ),
              ),
            ),
          ),
          settings: settings,
        );
      },
      // home: const HomePage(),
    );
  }
}

class ModalWithScroll extends StatelessWidget {
  const ModalWithScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Container(),
          middle: const Text('Modal Page'),
        ),
        child: SafeArea(
          bottom: false,
          child: ListView(
            shrinkWrap: true,
            controller: ModalScrollController.of(context),
            children: ListTile.divideTiles(
              context: context,
              tiles: List.generate(
                100,
                (index) => const ListTile(
                  title: Text('Item'),
                ),
              ),
            ).toList(),
          ),
        ),
      ),
    );
  }
}
