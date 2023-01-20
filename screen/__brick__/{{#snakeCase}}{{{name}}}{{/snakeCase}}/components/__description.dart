part of '../{{#snakeCase}}{{{name}}}{{/snakeCase}}_view.dart';

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '{{#titleCase}}{{{name}}}{{/titleCase}} is currently under construction.',
      ),
    );
  }
}
