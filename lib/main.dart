import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'util/logger.dart';
import 'util/provider_logger.dart';

const _logPrefix = '[MAIN]';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  logger.i('$_logPrefix runApp() START');

  runApp(
    ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      child: const App(),
    ),
  );
}
