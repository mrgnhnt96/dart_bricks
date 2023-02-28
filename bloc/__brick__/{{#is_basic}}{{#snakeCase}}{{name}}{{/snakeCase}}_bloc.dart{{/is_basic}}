import 'package:autoequal/autoequal.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as con;
import 'package:equatable/equatable.dart';

part '{{#snakeCase}}{{{name}}}{{/snakeCase}}_bloc.g.dart';
part '{{#snakeCase}}{{{name}}}{{/snakeCase}}_event.dart';
part '{{#snakeCase}}{{{name}}}{{/snakeCase}}_state.dart';

// ignore: avoid_private_typedef_functions
typedef _Emitter = Emitter<{{#pascalCase}}{{{name}}}{{/pascalCase}}State>;

class {{#pascalCase}}{{{name}}}{{/pascalCase}}Bloc extends Bloc<{{#pascalCase}}{{{name}}}{{/pascalCase}}Event, {{#pascalCase}}{{{name}}}{{/pascalCase}}State> {
  {{#pascalCase}}{{{name}}}{{/pascalCase}}Bloc() : super(const _Loading()) {
    on<_Init>(_init);
    on<_Fetch>(_fetch, transformer: con.droppable());

    add(const _Init());
  }

  Future<void> _init(_Init event, _Emitter emit) async {
    // TODO: implement _init
    throw UnimplementedError('_init() has not been implemented.');
  }

  Future<void> _fetch(_Fetch event, _Emitter emit) async {
    // TODO: implement _fetch
    throw UnimplementedError('_fetch() has not been implemented.');
  }
}
