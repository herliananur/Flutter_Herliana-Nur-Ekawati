import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:belajar_bloc/bloc/counter_event.dart';
import 'package:belajar_bloc/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<Increment>((event, emit) => emit(CounterState(state.value + 1)));
    on<Decrement>((event, emit) => emit(CounterState(state.value - 1)));
  }
}
