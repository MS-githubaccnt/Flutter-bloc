import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_bloc_app_1/presentation/bottom_navbar/bloc/bottom_navbar_event.dart";

class BottomNavBloc extends Bloc<navbarEvent,int>{
  BottomNavBloc():super(0){
    on<screenChange>((event,emit){
      emit(event.index);
    });
  }

}