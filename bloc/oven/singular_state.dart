// ignore_for_file: library_private_types_in_public_api

part of '_SINGULAR_snake_bloc.dart';

abstract class _SINGULAR_PASCALState extends Equatable {
  const _SINGULAR_PASCALState();

  _Error get asError => this as _Error;
  _Loading get asLoading => this as _Loading;
  _Ready get asReady => this as _Ready;

  bool get isDeleted => this is _Deleted;
  bool get isError => this is _Error;
  bool get isLoading => this is _Loading;
  bool get isReady => this is _Ready;

  @override
  List<Object?> get props => [];
}

@autoequal
class _Ready extends _SINGULAR_PASCALState {
  const _Ready(this._SINGULAR_CAMEL);

  final _SINGULAR_PASCAL _SINGULAR_CAMEL;

  @override
  List<Object?> get props => _$props;
}

class _Saving extends _SINGULAR_PASCALState {
  const _Saving();
}

class _Loading extends _SINGULAR_PASCALState {
  const _Loading();
}

class _Deleted extends _SINGULAR_PASCALState {
  const _Deleted();
}

@autoequal
class _Error extends _SINGULAR_PASCALState {
  const _Error(this.message);

  final String message;

  @override
  List<Object?> get props => _$props;
}
