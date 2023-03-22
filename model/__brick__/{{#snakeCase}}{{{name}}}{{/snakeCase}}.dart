import 'package:autoequal/autoequal.dart';
{{#copyWith}}
import 'package:copy_with_extension/copy_with_extension.dart';
{{/copyWith}}
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '{{#snakeCase}}{{{name}}}{{/snakeCase}}.g.dart';

@autoequal
{{#copyWith}}
@CopyWith()
{{/copyWith}}
@JsonSerializable()
class {{#pascalCase}}{{{name}}}{{/pascalCase}} extends Equatable {
  const {{#pascalCase}}{{{name}}}{{/pascalCase}}({
    required this.id,
  });

  const {{#pascalCase}}{{{name}}}{{/pascalCase}}.create() : id = 'NEW';

  // ignore: strict_raw_type
  factory {{#pascalCase}}{{{name}}}{{/pascalCase}}.fromJson(Map json) => _${{#pascalCase}}{{{name}}}{{/pascalCase}}FromJson(json);

  final String id;

  Map<String, dynamic> toJson() => _${{#pascalCase}}{{{name}}}{{/pascalCase}}ToJson(this);

  @override
  List<Object?> get props => _$props;
}
