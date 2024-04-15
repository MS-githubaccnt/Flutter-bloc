import 'package:flutter/material.dart';
import "package:bloc/bloc.dart";
import "package:binary/binary.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';
//take care of cose subscription and bloc.close
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const MyApp());
}
abstract class CounterEvent{
  
}
class CounterIncrement extends CounterEvent{}
class CounterDecrement extends CounterEvent{}
class ModeChange extends CounterEvent{

}
class CounterBloc extends Bloc<CounterEvent,int>{
  int themode=0;
    int getMode(){
      print("Ye raha mode $themode");
      
      return themode;
    }
  CounterBloc():super(0){
   
  on<CounterIncrement>((event,emit){
    emit(state+1);

  });
  on<CounterDecrement>((event,emit){
    emit(state-1);
  });
  on<ModeChange>((event,emit){
   (themode==0)?(themode=1):(themode=0);
   print(themode);
   
  });
  }
}
class MyApp extends StatelessWidget {
 const  MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home:BlocProvider(
        create: (context) =>CounterBloc(),
      child: counter(),)
    );
  }
}
class counter extends StatelessWidget{




  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(title:Text("Counter/Binary App",),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("The number:"),
            BlocBuilder<CounterBloc,int>(
             
              builder:(context,state) =>Column(
                children: [
                  
                  Text(state.toString()),Text(state.toBinary())
                  //(CounterBloc().getMode()==0)?Text(state.toString()):Text(state.toBinary())
                ],
              ),
              
            ),
           
            
            ToggleSwitch(initialLabelIndex:0,totalSwitches: 2,labels:["Counter","Binary"],
            
            onToggle:((index){BlocProvider.of<CounterBloc>(context).add(ModeChange());
            })),
            
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [IconButton(onPressed:(){BlocProvider.of<CounterBloc>(context).add(CounterIncrement());},
             icon:const Icon(Icons.add)),
            IconButton(onPressed: (){BlocProvider.of<CounterBloc>(context).add(CounterDecrement());},
             icon:const Icon(Icons.remove))],)
          ],
        ),
      ),
      
    );
  }
}

