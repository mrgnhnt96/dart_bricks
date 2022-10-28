part of '{{#snakeCase}}{{{name}}}{{/snakeCase}}_bloc.dart';

abstract class {{#pascalCase}}{{{name}}}{{/pascalCase}}Event extends Equatable {
  const {{#pascalCase}}{{{name}}}{{/pascalCase}}Event();
}

class _Init extends {{#pascalCase}}{{{name}}}{{/pascalCase}}Event {
  const _Init();

  @override
  List<Object> get props => [];
}

extension {{#pascalCase}}{{{name}}}{{/pascalCase}}BlocX on {{#pascalCase}}{{{name}}}{{/pascalCase}}Bloc {
  _Events get events => _Events(this);
}

class _Events {
  const _Events(this._bloc);

  final {{#pascalCase}}{{{name}}}{{/pascalCase}}Bloc _bloc;
}
