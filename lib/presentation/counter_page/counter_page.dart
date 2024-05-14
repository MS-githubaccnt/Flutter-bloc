import 'package:flutter/material.dart';
import "package:bloc/bloc.dart";
import "package:binary/binary.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_1/presentation/counter_page/bloc/counter_page_state.dart';
import 'package:toggle_switch/toggle_switch.dart';
import "package:flutter_bloc_app_1/presentation/counter_page/bloc/counter_page_bloc.dart";
import "package:flutter_bloc_app_1/presentation/counter_page/bloc/counter_page_event.dart";
import 'package:flutter_bloc_app_1/presentation/bottom_navbar/bottom_navbar.dart';
//take care of close subscription and bloc.close
//multiple taps

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
          children: [
            const Text("The number:"),
    
            BlocBuilder<CounterBloc,counterState>(
              
              builder:(context,state) =>Column(
                children: [
                 
                  //Text(state.toString()),Text(state.toBinary()),
                  (state.integerOrBinary==0)?Text(state.number.toString()):Text(state.number.toBinary())
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
      bottomNavigationBar:bottomNavBar
      
    );
  }
}
