import 'dart:async';

import 'package:autoequal/autoequal.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as con;
import 'package:equatable/equatable.dart';
import 'package:_PROJECT_SNAKE_application/utils/bloc_extensions.dart';
import 'package:_PROJECT_SNAKE_domain/domain.dart';

import 'package:_PROJECT_SNAKE_application/utils/persist_bloc.dart';

part '_NAME_snakes_bloc.g.dart';
part '_NAME_snakes_event.dart';
part '_NAME_snakes_state.dart';

// ignore: avoid_private_typedef_functions
typedef _Emitter = Emitter<_NAME_PASCALsState>;

class _NAME_PASCALsBloc
    extends PersistBloc<_NAME_PASCALsEvent, _NAME_PASCALsState> {
  _NAME_PASCALsBloc({
    required I_NAME_PASCALsCache _NAME_CAMELsCache,
    required I_NAME_PASCALsSource _NAME_CAMELsSource,
  })  : __NAME_CAMELsCache = _NAME_CAMELsCache,
        __NAME_CAMELsSource = _NAME_CAMELsSource,
        super(const _Loading()) {
    on<_Init>(_init);
    on<_Fetch>(_fetch, transformer: con.droppable());
    on<_CacheChanged>(_cacheChanged);
    on<_SourceChanged>(_sourceChanged);

    add(const _Init());
  }

  final I_NAME_PASCALsCache __NAME_CAMELsCache;
  final I_NAME_PASCALsSource __NAME_CAMELsSource;

  StreamSubscription<List<StreamResult<_NAME_PASCAL>>>? _sourceListener;

  @override
  Future<void> close() {
    _sourceListener?.cancel();
    return super.close();
  }

  @override
  Future<Stream<_NAME_PASCALsState?>> listenForStorageChanges() async {
    final result = await __NAME_CAMELsCache.watchAll();

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

    final result = await __NAME_CAMELsCache.all();

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
      await __NAME_CAMELsCache.deleteAll(toDelete);
    }

    final toUpdate = <_NAME_PASCAL>[];

    // check if any all have changed from state.asReady.all
    for (final e in state.asReady._NAME_CAMELs) {
      if (!all.contains(e)) {
        toUpdate.add(e);
      }
    }

    if (toUpdate.isNotEmpty) {
      await __NAME_CAMELsCache.saveAll(toUpdate);
    }
  }

  @override
  Future<_NAME_PASCALsState?> retrieve() async {
    final result = await __NAME_CAMELsCache.all();

    if (result.isError) {
      return null;
    }

    return _Ready(result.value);
  }

  FutureOr<void> _cacheChanged(_CacheChanged event, _Emitter emit) async {
    emitNoCache(emit, event.state);
  }

  Future<void> _fetch(_Fetch event, _Emitter emit) async {
    emit(const _Loading());

    await _get_NAME_PASCALs(emit);
  }

  Future<void> _get_NAME_PASCALs(_Emitter emit) async {
    final result = await __NAME_CAMELsSource.all();

    if (result.isError) {
      emitError(emit, _Error(result.error));
      return;
    }

    emit(_Ready(result.value));
  }

  Future<void> _init(_Init event, _Emitter emit) async {
    await hydrate(emit);

    await _get_NAME_PASCALs(emit);

    final stream = await __NAME_CAMELsSource.watchAll();

    _sourceListener = stream.listen((changes) {
      if (!state.isReady) {
        return;
      }

      if (isClosed) {
        return;
      }

      final _NAME_CAMELsById = state.asReady._NAME_CAMELs
          .asMap()
          .map((_, value) => MapEntry(value.id, value));

      for (final change in changes) {
        if (change.wasDeleted) {
          _NAME_CAMELsById.remove(change.key);
        } else {
          _NAME_CAMELsById[change.key] = change.value!;
        }
      }

      final newState = _Ready(_NAME_CAMELsById.values.toList());

      if (state == newState) {
        return;
      }

      add(_SourceChanged(newState));
    });
  }

  FutureOr<void> _sourceChanged(_SourceChanged event, _Emitter emit) async {
    emit(event.state);
  }
}
