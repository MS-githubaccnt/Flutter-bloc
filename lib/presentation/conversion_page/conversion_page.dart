import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_bloc_app_1/presentation/bottom_navbar/bottom_navbar.dart";
import "package:flutter_bloc_app_1/presentation/conversion_page/bloc/conversion_page_bloc.dart";
import "package:flutter_bloc_app_1/presentation/conversion_page/bloc/conversion_page_event.dart";
import 'package:any_base/any_base.dart';

const convert2decimal=AnyBase(AnyBase.bin, AnyBase.dec);
class conversion extends StatelessWidget{

 
  @override
  Widget build(BuildContext context){
    TextEditingController binaryController=TextEditingController(text:"0");
    
    return Scaffold(
      appBar:AppBar(title:Text("Binary to Decimal Convertor",),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,),
      body:Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text("Enter Binary below:"),
            
            TextField(

              inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
              keyboardType:TextInputType.number,
              controller:binaryController,
              onChanged: (value) {
                BlocProvider.of<ConversionBloc>(context).add(changeInText(value));
              },
            ),
            Text("Converted to Integer:"),
            BlocBuilder<ConversionBloc,String>(builder:(context,state)=>Text(convert2decimal.convert(state)))
            
            
          ],
        ),
      ),
      bottomNavigationBar:bottomNavBar,
      
    );}}
    