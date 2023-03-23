import 'dart:developer';

import 'package:internal_domain/domain.dart';

import 'package:data/util/util.dart';

class _NAME_pascalsSource implements I_NAME_pascalsSource {
  const _NAME_pascalsSource();

  @override
  Future<RequestResult<List<_NAME_pascal>>> all() async {
    try {
      final _NAME_camels = <_NAME_pascal>[];

      final result = await dio.get<Map>('${dio.url}/NOT_IMPLEMENTED');

      final data = result.data;

      if (data == null) {
        return RequestResult.failure('No data');
      }

      final _NAME_camelsJson = List<Map>.from(data as List);

      for (final _NAME_camelJson in _NAME_camelsJson) {
        try {
          _NAME_camels.add(
            _NAME_pascal.fromJson(
              Map<String, dynamic>.from(_NAME_camelJson),
            ),
          );
        } catch (e) {
          log('Error parsing _NAME_camel, $e | $_NAME_camelJson');
        }
      }

      return RequestResult.success(_NAME_camels);
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  @override
  Future<RequestResult<_NAME_pascal>> byId(String id) async {
    try {
      final result = await dio.get<Map>('${dio.url}/NOT_IMPLEMENTED/$id');

      final data = result.data;

      if (data == null) {
        return RequestResult.failure('No data');
      }

      final _NAME_camelJson = Map<String, dynamic>.from(data);

      return RequestResult.success(
        _NAME_pascal.fromJson(_NAME_camelJson),
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
  Future<RequestResult<void>> update(_NAME_pascal _NAME_camel) async {
    try {
      final id = _NAME_camel.id;

      await dio.put<Map>(
        '${dio.url}/NOT_IMPLEMENTED/$id',
        data: _NAME_camel.toJson(),
      );
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }
}
