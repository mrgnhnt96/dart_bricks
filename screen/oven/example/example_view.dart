import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'components/__description.dart';

class _NAME_pascalView extends StatelessWidget {
  const _NAME_pascalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('_NAME_title'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 16),
          const _Description(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              }
            },
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
