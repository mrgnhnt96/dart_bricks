part of '_PLURAL_snake_bloc.dart';

abstract class _PLURAL_PASCALEvent extends Equatable {
  const _PLURAL_PASCALEvent();

  @override
  List<Object?> get props => [];
}

@autoequal
class _Init extends _PLURAL_PASCALEvent {
  const _Init();

  @override
  List<Object?> get props => _$props;
}

class _Fetch extends _PLURAL_PASCALEvent {
  const _Fetch();
}

@autoequal
class _CacheChanged extends _PLURAL_PASCALEvent {
  const _CacheChanged(this.state);

  final _Ready state;

  @override
  List<Object?> get props => _$props;
}

@autoequal
class _SourceChanged extends _PLURAL_PASCALEvent {
  const _SourceChanged(this.state);

  final _Ready state;

  @override
  List<Object?> get props => _$props;
}

extension _PLURAL_PASCALBlocX on _PLURAL_PASCALBloc {
  // ignore: library_private_types_in_public_api
  _Events get events => _Events(this);
}

class _Events {
  const _Events(this._bloc);

  final _PLURAL_PASCALBloc _bloc;

  void fetch() {
    _bloc.add(const _Fetch());
  }
}
