// ignore_for_file: library_private_types_in_public_api

part of '_NAME_snakes_bloc.dart';

abstract class _NAME_PASCALsState extends Equatable {
  const _NAME_PASCALsState();

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
class _Ready extends _NAME_PASCALsState {
  const _Ready(this._NAME_CAMELs);

  final List<_NAME_PASCAL> _NAME_CAMELs;

  @override
  List<Object?> get props => _$props;
}

class _Loading extends _NAME_PASCALsState {
  const _Loading();
}

@autoequal
class _Error extends _NAME_PASCALsState {
  const _Error(this.message);

  final String message;

  @override
  List<Object?> get props => _$props;
}