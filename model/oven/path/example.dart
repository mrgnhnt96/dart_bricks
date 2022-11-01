import 'package:autoequal/autoequal.dart';
// start_COPY_WITH_
import 'package:copy_with_extension/copy_with_extension.dart';
// end_COPY_WITH_
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '_NAME_snake.g.dart';

@autoequal
// start_COPY_WITH_
@CopyWith()
// end_COPY_WITH_
@JsonSerializable()
class _NAME_pascal extends Equatable {
  const _NAME_pascal();

  factory _NAME_pascal.fromJson(Map<String, dynamic> json) =>
      _$_NAME_pascalFromJson(json);

  Map<String, dynamic> toJson() => _$_NAME_pascalToJson(this);

  @override
  List<Object?> get props => _$props;
}
