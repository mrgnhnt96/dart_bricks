import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
{{#json}}
import 'package:json_annotation/json_annotation.dart';
{{/json}}
import 'package:meta/meta.dart';
{{#json}}
part '{{#snakeCase}}{{{name}}}{{/snakeCase}}_bloc.g.dart';
{{/json}}
part '{{#snakeCase}}{{{name}}}{{/snakeCase}}_event.dart';
part '{{#snakeCase}}{{{name}}}{{/snakeCase}}_state.dart';

typedef _Emitter = Emitter<{{#pascalCase}}{{{name}}}{{/pascalCase}}State>;

class {{#pascalCase}}{{{name}}}{{/pascalCase}}Bloc extends Bloc<{{#pascalCase}}{{{name}}}{{/pascalCase}}Event, {{#pascalCase}}{{{name}}}{{/pascalCase}}State> {
  {{#pascalCase}}{{{name}}}{{/pascalCase}}Bloc() : super(const _Loading()) {
    on<_Init>(_init);

    add(const _Init());
  }

  Future<void> _init(_Init event, _Emitter emit) async {
    // TODO: implement _init
    throw UnimplementedError('_init() has not been implemented.');
  }
{{#json}}
  {{#pascalCase}}{{{name}}}{{/pascalCase}}State? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return _Ready.fromJson(json);
    }

    return null;
  }

  Map<String, dynamic>? toJson({{#pascalCase}}{{{name}}}{{/pascalCase}}State state) {
    if (state.isReady) {
      return state.asReady.toJson();
    }

    return null;
  }
{{/json}}
}
