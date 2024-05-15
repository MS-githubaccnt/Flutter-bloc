import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_bloc_app_1/presentation/conversion_page/bloc/conversion_page_event.dart";

class ConversionBloc extends Bloc<ConversionEvent,String>{
  ConversionBloc():super("0"){
    on<changeInText>((event,emit){
      emit(event.newText);
    });

  }

}