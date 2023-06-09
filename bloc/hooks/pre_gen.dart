import 'package:mason/mason.dart';
import 'package:shared_hook_methods/fetch_pubspec.dart';
import 'package:shared_hook_methods/get_project_name.dart';
import 'package:shared_hook_methods/make_plural.dart';
import 'package:shared_hook_methods/make_singular.dart';
import 'package:shared_hook_methods/symbols.dart';
import 'package:shared_hook_methods/verify_changes.dart';

part 'utils/__get_interface_and_name.dart';

enum Types { basic, plural, singular }

extension _TypesX on Types {
  String get key {
    switch (this) {
      case Types.basic:
        return 'is_basic';
      case Types.plural:
        return 'is_plural';
      case Types.singular:
        return 'is_singular';
    }
  }

  bool get isBasic => this == Types.basic;
}

void run(HookContext context) {
  final typeRaw = context.vars['type'] as String;

  final type = Types.values.byName(typeRaw.toLowerCase());

  context.vars[type.key] = true;

  final pubspec = fetchPubspec();

  context.vars['project'] = getProjectName(pubspec, 'application');

  final data = getInterfaceAndName(type, context.logger);

  context.vars = {
    ...context.vars,
    'interface': data.interface,
    'singular': data.singular,
    'plural': data.plural,
  };
}
