part of '_SINGULAR_snake_bloc.dart';

abstract class _SINGULAR_pascalEvent extends Equatable {
  const _SINGULAR_pascalEvent();

  @override
  List<Object?> get props => [];
}

class _Init extends _SINGULAR_pascalEvent {
  const _Init();
}

class _Fetch extends _SINGULAR_pascalEvent {
  const _Fetch();
}

extension _SINGULAR_pascalBlocX on _SINGULAR_pascalBloc {
  // ignore: library_private_types_in_public_api
  _Events get events => _Events(this);
}

class _Events {
  const _Events(this._bloc);

  final _SINGULAR_pascalBloc _bloc;

  void fetch() {
    _bloc.add(const _Fetch());
  }
}
