import 'package:flutter/material.dart';
import 'package:flutter_bloc_app_1/presentation/bottom_navbar/bloc/bottom_navbar_bloc.dart';
import 'package:flutter_bloc_app_1/presentation/conversion_page/conversion_page.dart';
import "package:flutter_bloc_app_1/presentation/counter_page/counter_page.dart";
import 'package:flutter_bloc_app_1/presentation/counter_page/bloc/counter_page_bloc.dart';
import "package:flutter_bloc/flutter_bloc.dart";

//take care of cose subscription and bloc.close
//multiple taps and need for plus to change 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
 const  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:<String,WidgetBuilder>{
        "/counter":(BuildContext context)=>counter(),
        "/conversion":(BuildContext context)=>conversion()

      },
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home:MultiBlocProvider(
        providers: [
        BlocProvider<CounterBloc>(create: (context) =>CounterBloc()),
        BlocProvider<BottomNavBloc>(create:(context)=>BottomNavBloc())],
      child: counter(),)
      
    );
  }
}
