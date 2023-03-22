import 'package:autoequal/autoequal.dart';
// section_COPY_WITH_
import 'package:copy_with_extension/copy_with_extension.dart';
// endSection_COPY_WITH_
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '_NAME_snake.g.dart';

@autoequal
// section_COPY_WITH_
@CopyWith()
// endSection_COPY_WITH_
@JsonSerializable()
class _NAME_pascalCase extends Equatable {
  const _NAME_pascal({
    required this.id,
  });

  const _NAME_pascal.create() : id = 'NEW';

  // ignore: strict_raw_type
  factory _NAME_pascal.fromJson(Map json) => _$_NAME_pascalFromJson(json);

  final String id;

  Map<String, dynamic> toJson() => _$_NAME_pascalToJson(this);

  @override
  List<Object?> get props => _$props;
}
