import 'package:autoequal/autoequal.dart';
// section_COPY_WITH_
import 'package:copy_with_extension/copy_with_extension.dart';
// endSection_COPY_WITH_
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '_SINGULAR_snake.g.dart';

@autoequal
// section_COPY_WITH_
@CopyWith()
// endSection_COPY_WITH_
@JsonSerializable()
class _SINGULAR_pascalCase extends Equatable {
  const _SINGULAR_pascal({
    required this.id,
  });

  const _SINGULAR_pascal.create() : id = 'NEW';

  // ignore: strict_raw_type
  factory _SINGULAR_pascal.fromJson(Map json) => _$_SINGULAR_pascalFromJson(json);

  final String id;

  Map<String, dynamic> toJson() => _$_SINGULAR_pascalToJson(this);

  @override
  List<Object?> get props => _$props;
}
