part of '_NAME_snake_bloc.dart';

abstract class _NAME_pascalEvent extends Equatable {
  const _NAME_pascalEvent();

  @override
  List<Object> get props => [];
}

class _Init extends _NAME_pascalEvent {
  const _Init();
}

class _Fetch extends _NAME_pascalEvent {
  const _Fetch([this.id]);

  final String? id;

  @override
  List<Object> get props => _$props;
}

extension _NAME_pascalBlocX on _NAME_pascalBloc {
  _Events get events => _Events(this);
}

class _Events {
  const _Events(this._bloc);

  final _NAME_pascalBloc _bloc;

  void fetch([String? id]) {
    _bloc.add(_Fetch(id));
  }
}
