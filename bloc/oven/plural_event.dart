part of '_NAME_snakes_bloc.dart';

abstract class _NAME_PASCALsEvent extends Equatable {
  const _NAME_PASCALsEvent();

  @override
  List<Object?> get props => [];
}

@autoequal
class _Init extends _NAME_PASCALsEvent {
  const _Init();

  @override
  List<Object?> get props => _$props;
}

class _Fetch extends _NAME_PASCALsEvent {
  const _Fetch();
}

@autoequal
class _CacheChanged extends _NAME_PASCALsEvent {
  const _CacheChanged(this.state);

  final _Ready state;

  @override
  List<Object?> get props => _$props;
}

extension _NAME_PASCALsBlocX on _NAME_PASCALsBloc {
  // ignore: library_private_types_in_public_api
  _Events get events => _Events(this);
}

class _Events {
  const _Events(this._bloc);

  final _NAME_PASCALsBloc _bloc;

  void fetch() {
    _bloc.add(const _Fetch());
  }
}
