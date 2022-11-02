import 'package:data/util/util.dart';
import 'package:domain/domain.dart';
import '_NAME_snake_repos.dart';
import 'package:flutter/material.dart';

class _NAME_pascalSource implements I_NAME_pascalSource {
  const _NAME_pascalSource();

  @override
  Future<RequestResult<List<_MODEL_pascal>>> all() async {
    try {
      final _MODEL_camels = <_MODEL_pascal>[];

      final result = await dio.get<Map>('${dio.url}/NOT_IMPLEMENTED');

      final data = result.data;

      if (data == null) {
        return RequestResult.failure('No data');
      }

      final _MODEL_camelsJson = List<Map>.from(data as List);

      for (final _MODEL_camelJson in _MODEL_camelsJson) {
        try {
          _MODEL_camels.add(
            _MODEL_pascal.fromJson(
              Map<String, dynamic>.from(_MODEL_camelJson),
            ),
          );
        } catch (e) {
          debugPrint('Error parsing _MODEL_camel, $e | _MODEL_camelJson');
        }
      }

      return RequestResult.success(_MODEL_camels);
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  @override
  Future<RequestResult<_MODEL_pascal>> byId(String id) async {
    try {
      final result = await dio.get<Map>('${dio.url}/NOT_IMPLEMENTED/$id');

      final data = result.data;

      if (data == null) {
        return RequestResult.failure('No data');
      }

      final _MODEL_camelJson = Map<String, dynamic>.from(data);

      return RequestResult.success(
        _MODEL_pascal.fromJson(_MODEL_camelJson),
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
  Future<RequestResult<void>> update(_MODEL_pascal _MODEL_camel) async {
    try {
      final id = _MODEL_camel.id;

      await dio.put<Map>(
        '${dio.url}/NOT_IMPLEMENTED/$id',
        data: _MODEL_camel.toJson(),
      );
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }
}
