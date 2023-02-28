{{#is_firebase}}
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internal_domain/domain.dart';

import 'package:internal_data/repos/{{#snakeCase}}{{{name}}}{{/snakeCase}}s/{{#snakeCase}}{{{name}}}{{/snakeCase}}s_repos.dart';
import 'package:internal_data/utils/request_result.dart';
{{/is_firebase}}
{{#is_dio}}
import 'package:data/util/util.dart';
import 'package:domain/domain.dart';
import '{{#snakeCase}}{{{name}}}{{/snakeCase}}_repos.dart';
import 'package:flutter/material.dart';
{{/is_dio}}

{{#is_firebase}}
class {{#pascalCase}}{{{name}}}{{/pascalCase}}sSource implements I{{#pascalCase}}{{{name}}}{{/pascalCase}}sSource {
  const {{#pascalCase}}{{{name}}}{{/pascalCase}}sSource();

  CollectionReference get collection =>
      FirebaseFirestore.instance.collection('{{#snakeCase}}{{{name}}}{{/snakeCase}}s');

  @override
  Future<RequestResult<List<{{#pascalCase}}{{{name}}}{{/pascalCase}}>>> all() async {
    final {{#camelCase}}{{{name}}}{{/camelCase}}s = <{{#pascalCase}}{{{name}}}{{/pascalCase}}>[];

    final snapshot = await collection.get();

    for (final doc in snapshot.docs) {
      final json = doc.data() as Map?;

      if (json == null) {
        continue;
      }

      json['id'] = doc.id;

      try {
        final {{#camelCase}}{{{name}}}{{/camelCase}} =
            {{#pascalCase}}{{{name}}}{{/pascalCase}}.fromJson(Map<String, dynamic>.from(json));

        {{#camelCase}}{{{name}}}{{/camelCase}}s.add({{#camelCase}}{{{name}}}{{/camelCase}});
      } catch (e) {
        debugPrint('$e');
      }
    }

    return RequestResult.success({{#camelCase}}{{{name}}}{{/camelCase}}s);
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>> byId(String id) async {
    final snapshot = await collection.doc(id).get();

    final json = snapshot.data() as Map?;

    if (json == null) {
      return const RequestResult.failure('{{#sentenceCase}}{{{name}}}{{/sentenceCase}} not found');
    }

    json['id'] = snapshot.id;

    try {
      final {{#camelCase}}{{{name}}}{{/camelCase}} =
          {{#pascalCase}}{{{name}}}{{/pascalCase}}.fromJson(Map<String, dynamic>.from(json));

      return RequestResult.success({{#camelCase}}{{{name}}}{{/camelCase}});
    } catch (e) {
      debugPrint('$e');

      return const RequestResult.failure('{{#sentenceCase}}{{{name}}}{{/sentenceCase}} not found');
    }
  }

  @override
  Future<RequestResult<void>> update({{#pascalCase}}{{{name}}}{{/pascalCase}} {{#camelCase}}{{{name}}}{{/camelCase}}) async {
    try {
      await collection.doc({{#camelCase}}{{{name}}}{{/camelCase}}.id).set({{#camelCase}}{{{name}}}{{/camelCase}}.toJson());
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }

  @override
  Future<Stream<StreamResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>>> watchById(String id) async {
    try {
      final stream = collection.doc(id).snapshots();

      return stream.map((snapshot) {
        final json = snapshot.data() as Map?;

        if (json == null) {
          return StreamResult.failure('{{#sentenceCase}}{{{name}}}{{/sentenceCase}} not found');
        }

        json['id'] = snapshot.id;

        try {
          final {{#camelCase}}{{{name}}}{{/camelCase}} =
              {{#pascalCase}}{{{name}}}{{/pascalCase}}.fromJson(Map<String, dynamic>.from(json));

          return StreamResult({{#camelCase}}{{{name}}}{{/camelCase}}, key: {{#camelCase}}{{{name}}}{{/camelCase}}.id);
        } catch (e) {
          debugPrint('$e');

          return StreamResult.failure('{{#sentenceCase}}{{{name}}}{{/sentenceCase}} not found');
        }
      });
    } catch (e) {
      return Stream.value(StreamResult.failure(e.toString()));
    }
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>> create() async {
    final new{{#pascalCase}}{{{name}}}{{/pascalCase}} = {{#pascalCase}}{{{name}}}{{/pascalCase}}.create();

    try {
      final doc = collection.doc();

      final json = new{{#pascalCase}}{{{name}}}{{/pascalCase}}.toJson();

      json['id'] = doc.id;

      await doc.set(json);

      return RequestResult.success({{#pascalCase}}{{{name}}}{{/pascalCase}}.fromJson(json));
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  @override
  Future<RequestResult<void>> updateMany(
    List<{{#pascalCase}}{{{name}}}{{/pascalCase}}> {{#camelCase}}{{{name}}}{{/camelCase}}s,
  ) async {
    try {
      var batch = FirebaseFirestore.instance.batch();

      var count = 0;
      for (final {{#camelCase}}{{{name}}}{{/camelCase}} in {{#camelCase}}{{{name}}}{{/camelCase}}s) {
        batch.set(collection.doc({{#camelCase}}{{{name}}}{{/camelCase}}.id), {{#camelCase}}{{{name}}}{{/camelCase}}.toJson());

        count++;

        if (count == 500) {
          await batch.commit();

          batch = FirebaseFirestore.instance.batch();

          count = 0;
        }
      }

      await batch.commit();
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> delete(String id) async {
    try {
      await collection.doc(id).delete();
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }
}

{{/is_firebase}}

{{#is_dio}}
class {{#pascalCase}}{{{name}}}{{/pascalCase}}sSource implements I{{#pascalCase}}{{{name}}}{{/pascalCase}}sSource {
  const {{#pascalCase}}{{{name}}}{{/pascalCase}}sSource();

  @override
  Future<RequestResult<List<{{#pascalCase}}{{{name}}}{{/pascalCase}}>>> all() async {
    try {
      final {{#camelCase}}{{{name}}}{{/camelCase}}s = <{{#pascalCase}}{{{name}}}{{/pascalCase}}>[];

      final result = await dio.get<Map>('${dio.url}/NOT_IMPLEMENTED');

      final data = result.data;

      if (data == null) {
        return RequestResult.failure('No data');
      }

      final {{#camelCase}}{{{name}}}{{/camelCase}}sJson = List<Map>.from(data as List);

      for (final {{#camelCase}}{{{name}}}{{/camelCase}}Json in {{#camelCase}}{{{name}}}{{/camelCase}}sJson) {
        try {
          {{#camelCase}}{{{name}}}{{/camelCase}}s.add(
            {{#pascalCase}}{{{name}}}{{/pascalCase}}.fromJson(
              Map<String, dynamic>.from({{#camelCase}}{{{name}}}{{/camelCase}}Json),
            ),
          );
        } catch (e) {
          debugPrint('Error parsing {{#camelCase}}{{{name}}}{{/camelCase}}, $e | ${{#camelCase}}{{{name}}}{{/camelCase}}Json');
        }
      }

      return RequestResult.success({{#camelCase}}{{{name}}}{{/camelCase}}s);
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>> byId(String id) async {
    try {
      final result = await dio.get<Map>('${dio.url}/NOT_IMPLEMENTED/$id');

      final data = result.data;

      if (data == null) {
        return RequestResult.failure('No data');
      }

      final {{#camelCase}}{{{name}}}{{/camelCase}}Json = Map<String, dynamic>.from(data);

      return RequestResult.success(
        {{#pascalCase}}{{{name}}}{{/pascalCase}}.fromJson({{#camelCase}}{{{name}}}{{/camelCase}}Json),
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
  Future<RequestResult<void>> update({{#pascalCase}}{{{name}}}{{/pascalCase}} {{#camelCase}}{{{name}}}{{/camelCase}}) async {
    try {
      final id = {{#camelCase}}{{{name}}}{{/camelCase}}.id;

      await dio.put<Map>(
        '${dio.url}/NOT_IMPLEMENTED/$id',
        data: {{#camelCase}}{{{name}}}{{/camelCase}}.toJson(),
      );
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }
}

{{/is_dio}}