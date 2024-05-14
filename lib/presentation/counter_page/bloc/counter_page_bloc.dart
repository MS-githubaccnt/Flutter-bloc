import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_bloc_app_1/presentation/counter_page/bloc/counter_page_event.dart";
import "package:flutter_bloc_app_1/presentation/counter_page/bloc/counter_page_state.dart";

class CounterBloc extends Bloc<CounterEvent,counterState>{

  CounterBloc():super(counterState(0,0)){
 
  on<CounterIncrement>((event,emit){
    
    emit(counterState(state.number+1,state.integerOrBinary));


  });
  on<CounterDecrement>((event,emit){
    emit(counterState(state.number-1,state.integerOrBinary));
   
  });
  on<ModeChange>((event,emit){
    emit(counterState(state.number, (state.integerOrBinary==0)?1:0));

 
   
  });
  }
}