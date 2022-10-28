part of '{{#snakeCase}}{{{name}}}{{/snakeCase}}_bloc.dart';

abstract class {{#pascalCase}}{{{name}}}{{/pascalCase}}Event extends Equatable {
  const {{#pascalCase}}{{{name}}}{{/pascalCase}}Event();

  @override
  List<Object> get props => [];
}

class _Init extends {{#pascalCase}}{{{name}}}{{/pascalCase}}Event {
  const _Init();
}

class _Fetch extends {{#pascalCase}}{{{name}}}{{/pascalCase}}Event {
  const _Fetch([this.id]);

  final String? id;

  @override
  List<Object> get props => _$props;
}

extension {{#pascalCase}}{{{name}}}{{/pascalCase}}BlocX on {{#pascalCase}}{{{name}}}{{/pascalCase}}Bloc {
  _Events get events => _Events(this);
}

class _Events {
  const _Events(this._bloc);

  final {{#pascalCase}}{{{name}}}{{/pascalCase}}Bloc _bloc;

  void fetch([String? id]) {
    _bloc.add(_Fetch(id));
  }
}
