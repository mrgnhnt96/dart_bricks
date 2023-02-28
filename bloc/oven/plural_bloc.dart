import 'dart:async';

import 'package:autoequal/autoequal.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as con;
import 'package:equatable/equatable.dart';
import 'package:internal_application/utils/bloc_extensions.dart';
import 'package:internal_data/data.dart';
import 'package:internal_domain/domain.dart';

import 'package:internal_application/utils/persist_bloc.dart';

part '_NAME_snake_bloc.g.dart';
part '_NAME_snake_event.dart';
part '_NAME_snake_state.dart';

// ignore: avoid_private_typedef_functions
typedef _Emitter = Emitter<_NAME_PASCALsState>;

class _NAME_PASCALsBloc
    extends PersistBloc<_NAME_PASCALsEvent, _NAME_PASCALsState> {
  _NAME_PASCALsBloc({
    required I_NAME_PASCALCache _NAME_CAMELCache,
    required I_NAME_PASCALSource _NAME_CAMELSource,
  })  : __NAME_CAMELCache = _NAME_CAMELCache,
        __NAME_CAMELSource = _NAME_CAMELSource,
        super(const _Loading()) {
    on<_Init>(_init);
    on<_Fetch>(_fetch, transformer: con.droppable());
    on<_CacheChanged>(_cacheChanged);

    add(const _Init());
  }

  final I_NAME_PASCALCache __NAME_CAMELCache;
  final I_NAME_PASCALSource __NAME_CAMELSource;

  @override
  Future<Stream<_NAME_PASCALsState?>> listenForStorageChanges() async {
    final result = await __NAME_CAMELCache.watchAll();

    return result.asyncMap((event) {
      if (!state.isReady) {
        return null;
      }

      if (event.isFailure) {
        return null;
      }

      final _NAME_CAMELs = [...state.asReady._NAME_CAMELs];

      if (event.wasDeleted) {
        _NAME_CAMELs.removeWhere((e) => e.id == event.key);
      } else {
        final value = event.value;

        if (value == null) {
          return null;
        }

        final index = _NAME_CAMELs.indexWhere((e) => e.id == event.key);

        if (index == -1) {
          _NAME_CAMELs.add(value);
        } else {
          _NAME_CAMELs[index] = value;
        }
      }

      return _Ready(_NAME_CAMELs);
    });
  }

  @override
  void onStorageChanged(_NAME_PASCALsState state) {
    if (state.isReady) {
      add(_CacheChanged(state.asReady));
    }
  }

  @override
  Future<void> persist(_NAME_PASCALsState state) async {
    if (!state.isReady) {
      return;
    }

    final result = await __NAME_CAMELCache.all();

    if (result.isError) {
      return;
    }

    final all = result.value;

    final ids = state.asReady._NAME_CAMELs.map((e) => e.id).toSet();

    final toDelete = all.fold(<String>{}, (previous, e) {
      if (!ids.contains(e.id)) {
        previous.add(e.id);
      }

      return previous;
    });

    if (toDelete.isNotEmpty) {
      await __NAME_CAMELCache.deleteAll(toDelete);
    }

    final toUpdate = <_NAME_PASCAL>[];

    // check if any all have changed from state.asReady.all
    for (final e in state.asReady._NAME_CAMELs) {
      if (!all.contains(e)) {
        toUpdate.add(e);
      }
    }

    if (toUpdate.isNotEmpty) {
      await __NAME_CAMELCache.saveAll(toUpdate);
    }
  }

  @override
  Future<_NAME_PASCALsState?> retrieve() async {
    final result = await __NAME_CAMELCache.all();

    if (result.isError) {
      return null;
    }

    return _Ready(result.value);
  }

  Future<void> _init(_Init event, _Emitter emit) async {
    await hydrate(emit);

    await _get_NAME_PASCALs(emit);
  }

  Future<void> _fetch(_Fetch event, _Emitter emit) async {
    emit(const _Loading());

    await _get_NAME_PASCALs(emit);
  }

  Future<void> _get_NAME_PASCALs(_Emitter emit) async {
    final result = await __NAME_CAMELSource.all();

    if (result.isError) {
      emitError(emit, _Error(result.error.message));
      return;
    }

    emit(_Ready(result.value));
  }

  FutureOr<void> _cacheChanged(_CacheChanged event, _Emitter emit) async {
    emitNoCache(emit, event.state);
  }
}
