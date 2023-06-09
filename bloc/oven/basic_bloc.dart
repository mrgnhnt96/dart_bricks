import 'package:autoequal/autoequal.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as con;
import 'package:equatable/equatable.dart';

part '_SINGULAR_snake_bloc.g.dart';
part '_SINGULAR_snake_event.dart';
part '_SINGULAR_snake_state.dart';

// ignore: avoid_private_typedef_functions
typedef _Emitter = Emitter<_SINGULAR_pascalState>;

class _SINGULAR_pascalBloc
    extends Bloc<_SINGULAR_pascalEvent, _SINGULAR_pascalState> {
  _SINGULAR_pascalBloc() : super(const _Loading()) {
    on<_Init>(_init);
    on<_Fetch>(_fetch, transformer: con.droppable());

    add(const _Init());
  }

  Future<void> _init(_Init event, _Emitter emit) async {
    // TODO: implement _init
    throw UnimplementedError('_init() has not been implemented.');
  }

  Future<void> _fetch(_Fetch event, _Emitter emit) async {
    // TODO: implement _fetch
    throw UnimplementedError('_fetch() has not been implemented.');
  }
}
