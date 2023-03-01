import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internal_domain/domain.dart';

import 'package:internal_data/repos/_NAME_SNAKEs/_NAME_SNAKEs_repos.dart';
import 'package:internal_data/utils/request_result.dart';

class _NAME_PASCALsSource implements I_NAME_PASCALsSource {
  const _NAME_PASCALsSource();

  CollectionReference get collection =>
      FirebaseFirestore.instance.collection('_NAME_SNAKEs');

  @override
  Future<RequestResult<List<_NAME_PASCAL>>> all() async {
    final _NAME_CAMELs = <_NAME_PASCAL>[];

    final snapshot = await collection.get();

    for (final doc in snapshot.docs) {
      final json = doc.data() as Map?;

      if (json == null) {
        continue;
      }

      json['id'] = doc.id;

      try {
        final _NAME_CAMEL =
            _NAME_PASCAL.fromJson(Map<String, dynamic>.from(json));

        _NAME_CAMELs.add(_NAME_CAMEL);
      } catch (e) {
        debugPrint('$e');
      }
    }

    return RequestResult.success(_NAME_CAMELs);
  }

  @override
  Future<RequestResult<_NAME_PASCAL>> byId(String id) async {
    final snapshot = await collection.doc(id).get();

    final json = snapshot.data() as Map?;

    if (json == null) {
      return const RequestResult.failure('_NAME_SENTENCE not found');
    }

    json['id'] = snapshot.id;

    try {
      final _NAME_CAMEL =
          _NAME_PASCAL.fromJson(Map<String, dynamic>.from(json));

      return RequestResult.success(_NAME_CAMEL);
    } catch (e) {
      debugPrint('$e');

      return const RequestResult.failure('_NAME_SENTENCE not found');
    }
  }

  @override
  Future<RequestResult<void>> update(_NAME_PASCAL _NAME_CAMEL) async {
    try {
      await collection.doc(_NAME_CAMEL.id).set(_NAME_CAMEL.toJson());
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }

  @override
  Future<Stream<StreamResult<_NAME_PASCAL>>> watchById(String id) async {
    try {
      final stream = collection.doc(id).snapshots();

      return stream.map((snapshot) {
        final json = snapshot.data() as Map?;

        if (json == null) {
          return StreamResult.failure('_NAME_SENTENCE not found');
        }

        json['id'] = snapshot.id;

        try {
          final _NAME_CAMEL =
              _NAME_PASCAL.fromJson(Map<String, dynamic>.from(json));

          return StreamResult(_NAME_CAMEL, key: _NAME_CAMEL.id);
        } catch (e) {
          debugPrint('$e');

          return StreamResult.failure('_NAME_SENTENCE not found');
        }
      });
    } catch (e) {
      return Stream.value(StreamResult.failure(e.toString()));
    }
  }

  @override
  Future<RequestResult<_NAME_PASCAL>> create() async {
    final new_NAME_PASCAL = _NAME_PASCAL.create();

    try {
      final doc = collection.doc();

      final json = new_NAME_PASCAL.toJson();

      json['id'] = doc.id;

      await doc.set(json);

      return RequestResult.success(_NAME_PASCAL.fromJson(json));
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  @override
  Future<RequestResult<void>> updateMany(
    List<_NAME_PASCAL> _NAME_CAMELs,
  ) async {
    try {
      var batch = FirebaseFirestore.instance.batch();

      var count = 0;
      for (final _NAME_CAMEL in _NAME_CAMELs) {
        batch.set(collection.doc(_NAME_CAMEL.id), _NAME_CAMEL.toJson());

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
