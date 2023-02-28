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
typedef _Emitter = Emitter<_NAME_PASCALState>;

class _NAME_PASCALBloc
    extends PersistBloc<_NAME_PASCALEvent, _NAME_PASCALState> {
  _NAME_PASCALBloc({
    required I_NAME_PASCALsCache _NAME_CAMELsCache,
    required I_NAME_PASCALsSource _NAME_CAMELsSource,
  })  : __NAME_CAMELsCache = _NAME_CAMELsCache,
        __NAME_CAMELsSource = _NAME_CAMELsSource,
        super(const _Loading()) {
    on<_Init>(_init, transformer: con.droppable());
    on<_Save>(_save, transformer: con.droppable());
    on<_CacheChanged>(_cacheChanged);
    on<_SourceChanged>(_sourceChanged);
  }

  final I_NAME_PASCALsCache __NAME_CAMELsCache;
  final I_NAME_PASCALsSource __NAME_CAMELsSource;

  late String __NAME_CAMELId;

  StreamSubscription<StreamResult<_NAME_PASCAL>>? _listener;

  @override
  Future<void> close() async {
    await _listener?.cancel();

    await super.close();
  }

  Future<void> _init(_Init event, _Emitter emit) async {
    __NAME_CAMELId = event.id;

    await hydrate(emit);

    final result = await __NAME_CAMELsSource.byId(__NAME_CAMELId);

    if (result.isError) {
      emitError(emit, _Error(result.error.message));
      return;
    }

    emit(_Ready(result.value));

    final stream = await __NAME_CAMELsSource.watchById(__NAME_CAMELId);

    await _listener?.cancel();

    _listener = stream.listen((event) {
      if (event.wasDeleted) {
        add(const _SourceChanged(_Error('_NAME_PASCAL was deleted')));
        return;
      }

      final _NAME_CAMEL = event.value;

      if (_NAME_CAMEL == null) {
        return;
      }

      final newState = _Ready(_NAME_CAMEL);

      if (newState == state) {
        return;
      }

      add(_SourceChanged(newState));
    });
  }

  FutureOr<void> _cacheChanged(_CacheChanged event, _Emitter emit) async {
    emitNoCache(emit, event.state);
  }

  @override
  Future<Stream<_NAME_PASCALState?>> listenForStorageChanges() async {
    final result = await __NAME_CAMELsCache.watchById(__NAME_CAMELId);

    return result.asyncMap((event) {
      if (!state.isReady) {
        return null;
      }

      if (event.isFailure) {
        return null;
      }

      if (event.wasDeleted) {
        return null;
      }

      final _NAME_CAMEL = event.value;

      if (_NAME_CAMEL == null) {
        return null;
      }

      return _Ready(_NAME_CAMEL);
    });
  }

  @override
  void onStorageChanged(_NAME_PASCALState state) {
    if (state.isReady) {
      add(_CacheChanged(state.asReady));
    }
  }

  @override
  Future<void> persist(_NAME_PASCALState state) async {
    if (!state.isReady) {
      return;
    }

    final _NAME_CAMEL =
        await __NAME_CAMELsCache.byId(state.asReady._NAME_CAMEL.id);

    if (_NAME_CAMEL.isSuccess &&
        _NAME_CAMEL.value == state.asReady._NAME_CAMEL) {
      return;
    }

    await __NAME_CAMELsCache.save(state.asReady._NAME_CAMEL);
  }

  @override
  Future<_NAME_PASCALState?> retrieve() async {
    final result = await __NAME_CAMELsCache.byId(__NAME_CAMELId);

    if (result.isError) {
      return null;
    }

    return _Ready(result.value);
  }

  FutureOr<void> _save(_Save event, _Emitter emit) async {
    if (!state.isReady) {
      return;
    }

    final result = await __NAME_CAMELsSource.update(event._NAME_CAMEL);

    if (result.isError) {
      emitError(emit, _Error(result.error.message));
      return;
    }

    emit(_Ready(event._NAME_CAMEL));
  }

  FutureOr<void> _sourceChanged(_SourceChanged event, _Emitter emit) async {
    await stopListeningToChanges();

    emit(event.state);
  }
}
