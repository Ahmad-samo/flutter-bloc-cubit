import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counterValue = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {});
    on<AddCounter>(_mapAddCounter);
    on<MinuesCounter>(_mapmMinuesCounter);
  }

  _mapAddCounter(AddCounter event, Emitter<CounterState> emit) {
    counterValue = counterValue + event.value;
    emit(UpdateValue(newValue: counterValue));
  }

  _mapmMinuesCounter(MinuesCounter event, Emitter<CounterState> emit) {
    counterValue = counterValue - event.value;
    emit(UpdateValue(newValue: counterValue));
  }
}
