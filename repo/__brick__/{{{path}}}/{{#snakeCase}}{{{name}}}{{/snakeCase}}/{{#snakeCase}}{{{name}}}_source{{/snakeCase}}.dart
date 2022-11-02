import 'package:data/util/util.dart';
import 'package:domain/domain.dart';
import '{{#snakeCase}}{{{name}}}{{/snakeCase}}_repos.dart';
import 'package:flutter/material.dart';

class {{#pascalCase}}{{{name}}}{{/pascalCase}}Source implements I{{#pascalCase}}{{{name}}}{{/pascalCase}}Source {
  const {{#pascalCase}}{{{name}}}{{/pascalCase}}Source();

  @override
  Future<RequestResult<List<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> all() async {
    try {
      final {{#camelCase}}{{{model}}}{{/camelCase}}s = <{{#pascalCase}}{{{model}}}{{/pascalCase}}>[];

      final result = await dio.get<Map>('${dio.url}/NOT_IMPLEMENTED');

      final data = result.data;

      if (data == null) {
        return RequestResult.failure('No data');
      }

      final {{#camelCase}}{{{model}}}{{/camelCase}}sJson = List<Map>.from(data as List);

      for (final {{#camelCase}}{{{model}}}{{/camelCase}}Json in {{#camelCase}}{{{model}}}{{/camelCase}}sJson) {
        try {
          {{#camelCase}}{{{model}}}{{/camelCase}}s.add(
            {{#pascalCase}}{{{model}}}{{/pascalCase}}.fromJson(
              Map<String, dynamic>.from({{#camelCase}}{{{model}}}{{/camelCase}}Json),
            ),
          );
        } catch (e) {
          debugPrint('Error parsing {{#camelCase}}{{{model}}}{{/camelCase}}, $e | {{#camelCase}}{{{model}}}{{/camelCase}}Json');
        }
      }

      return RequestResult.success({{#camelCase}}{{{model}}}{{/camelCase}}s);
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> byId(String id) async {
    try {
      final result = await dio.get<Map>('${dio.url}/NOT_IMPLEMENTED/$id');

      final data = result.data;

      if (data == null) {
        return RequestResult.failure('No data');
      }

      final {{#camelCase}}{{{model}}}{{/camelCase}}Json = Map<String, dynamic>.from(data);

      return RequestResult.success(
        {{#pascalCase}}{{{model}}}{{/pascalCase}}.fromJson({{#camelCase}}{{{model}}}{{/camelCase}}Json),
      );
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  @override
  Future<RequestResult<void>> delete(String id) async {
    try {
      await dio.delete<Map>(
        '${dio.url}/NOT_IMPLEMENTED/$id',
      );

      return const RequestResult.success(null);
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  @override
  Future<RequestResult<void>> update({{#pascalCase}}{{{model}}}{{/pascalCase}} {{#camelCase}}{{{model}}}{{/camelCase}}) async {
    try {
      final id = {{#camelCase}}{{{model}}}{{/camelCase}}.id;

      await dio.put<Map>(
        '${dio.url}/NOT_IMPLEMENTED/$id',
        data: {{#camelCase}}{{{model}}}{{/camelCase}}.toJson(),
      );
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }
}
