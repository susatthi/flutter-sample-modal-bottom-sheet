import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color.g.dart';

/// シードカラー
@riverpod
Color seedColor(Ref ref) {
  return Colors.green;
}

/// カラースキーマ
@riverpod
ColorScheme colorScheme(
  Ref ref, {
  required Brightness brightness,
}) {
  return ColorScheme.fromSeed(
    brightness: brightness,
    seedColor: ref.watch(seedColorProvider),
  );
}
