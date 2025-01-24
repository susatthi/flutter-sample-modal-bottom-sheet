import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/ui/component/color.dart';

part 'theme.g.dart';

/// テーマデータ
@riverpod
ThemeData themeData(
  Ref ref, {
  required Brightness brightness,
}) {
  final colorScheme = ref.watch(colorSchemeProvider(brightness: brightness));
  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
  );
}
