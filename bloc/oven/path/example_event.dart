part of '_NAME_snake_bloc.dart';

abstract class _NAME_pascalEvent extends Equatable {
  const _NAME_pascalEvent();
}

class _Init extends _NAME_pascalEvent {
  const _Init();

  @override
  List<Object> get props => [];
}

extension _NAME_pascalBlocX on _NAME_pascalBloc {
  _Events get events => _Events(this);
}

class _Events {
  const _Events(this._bloc);

  final _NAME_pascalBloc _bloc;
}
