// ignore_for_file: library_private_types_in_public_api

part of 'bevy_bracket_bloc.dart';

abstract class _NAME_PASCALState extends Equatable {
  const _NAME_PASCALState();

  bool get isReady => this is _Ready;
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;

  _Ready get asReady => this as _Ready;
  _Loading get asLoading => this as _Loading;
  _Error get asError => this as _Error;

  @override
  List<Object?> get props => [];
}

@autoequal
class _Ready extends _NAME_PASCALState {
  const _Ready(this._NAME_CAMEL);

  final _NAME_PASCAL _NAME_CAMEL;

  @override
  List<Object?> get props => _$props;
}

class _Loading extends _NAME_PASCALState {
  const _Loading();
}

@autoequal
class _Error extends _NAME_PASCALState {
  const _Error(this.message);

  final String message;

  @override
  List<Object?> get props => _$props;
}
