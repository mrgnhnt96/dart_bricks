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
  List<Object> get props => [];
}

// start_JSON_
@JsonSerializable()
// end_JSON_
class _Ready extends _NAME_pascalState {
  const _Ready();

  // start_JSON_
  factory _Ready.fromJson(Map<String, dynamic> json) => _$ReadyFromJson(json);

  Map<String, dynamic> toJson() => _$ReadyToJson(this);
  // end_JSON_

  @override
  List<Object> get props => _$props;
}

class _Loading extends _NAME_pascalState {
  const _Loading();
}

class _Error extends _NAME_pascalState {
  const _Error(this.message);

  final String message;

  @override
  List<Object> get props => _$props;
}
