part of '_NAME_snake_bloc.dart';

abstract class _NAME_pascalState extends Equatable {
  const _NAME_pascalState();

  bool get isReady => this is _Ready;
  bool get isLoading => this is _Loading;
  bool get isError => this is _Error;

  _Ready get asReady => this as _Ready;
  _Loading get asLoading => this as _Loading;
  _Error get asError => this as _Error;

  @override
  List<Object?> get props => [];
}

// section_JSON_
@JsonSerializable()
// endSection_JSON_
@autoequal
class _Ready extends _NAME_pascalState {
  const _Ready();

  // section_JSON_
  factory _Ready.fromJson(Map<String, dynamic> json) => _$ReadyFromJson(json);

  Map<String, dynamic> toJson() => _$ReadyToJson(this);
  // endSection_JSON_

  @override
  List<Object?> get props => _$props;
}

class _Loading extends _NAME_pascalState {
  const _Loading();
}

@autoequal
class _Error extends _NAME_pascalState {
  const _Error(this.message);

  final String message;

  @override
  List<Object?> get props => _$props;
}
