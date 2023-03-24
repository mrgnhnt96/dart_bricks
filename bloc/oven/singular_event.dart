part of '_NAME_snake_bloc.dart';

abstract class _NAME_PASCALEvent extends Equatable {
  const _NAME_PASCALEvent();

  @override
  List<Object?> get props => [];
}

@autoequal
class _Init extends _NAME_PASCALEvent {
  const _Init(this.id);

  final String id;

  @override
  List<Object?> get props => _$props;
}

class _Fetch extends _NAME_PASCALEvent {
  const _Fetch();
}

class _Create extends _NAME_PASCALEvent {
  const _Create();
}

@autoequal
class _Save extends _NAME_PASCALEvent {
  const _Save(this._NAME_CAMEL);

  final _NAME_PASCAL _NAME_CAMEL;

  @override
  List<Object?> get props => _$props;
}

class _Delete extends _NAME_PASCALEvent {
  const _Delete();
}

@autoequal
class _CacheChanged extends _NAME_PASCALEvent {
  const _CacheChanged(this.state);

  final _Ready state;

  @override
  List<Object?> get props => _$props;
}

@autoequal
class _SourceChanged extends _NAME_PASCALEvent {
  const _SourceChanged(this.state);

  final _NAME_PASCALState state;

  @override
  List<Object?> get props => _$props;
}

extension _NAME_PASCALBlocX on _NAME_PASCALBloc {
  // ignore: library_private_types_in_public_api
  _Events get events => _Events(this);
}

class _Events {
  const _Events(this._bloc);

  final _NAME_PASCALBloc _bloc;

  void create() {
    _bloc.add(const _Create());
  }

  void delete() {
    _bloc.add(const _Delete());
  }

  void fetch() {
    _bloc.add(const _Fetch());
  }

  void init(String id) {
    _bloc.add(_Init(id));
  }

  void save(_NAME_PASCAL _NAME_CAMEL) {
    _bloc.add(_Save(_NAME_CAMEL));
  }
}
