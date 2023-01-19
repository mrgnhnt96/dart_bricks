import 'package:flutter/material.dart';

part 'components/__description.dart';

class _NAME_pascalView extends StatelessWidget {
  const _NAME_pascalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const _Description(),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Do something'),
        ),
      ],
    );
  }
}
