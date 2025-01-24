import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('modal_bottom_sheet Sample'),
        actions: const [],
      ),
      body: const CupertinoPageScaffold(
        child: _Body(),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _ShowModalSheetButton(),
        ],
      ),
    );
  }
}

class _ShowModalSheetButton extends StatelessWidget {
  const _ShowModalSheetButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () async {
          await showCupertinoModalBottomSheet<void>(
            context: context,
            expand: true,
            builder: (context) => const ModalFit(),
          );
        },
        child: const Text('Show BottomSheet'),
      ),
    );
  }
}

class ModalFit extends StatelessWidget {
  const ModalFit({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: const Text('Edit'),
              leading: const Icon(Icons.edit),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: const Text('Copy'),
              leading: const Icon(Icons.content_copy),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: const Text('Cut'),
              leading: const Icon(Icons.content_cut),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: const Text('Move'),
              leading: const Icon(Icons.folder_open),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: const Text('Delete'),
              leading: const Icon(Icons.delete),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
