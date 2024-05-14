import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_bloc_app_1/presentation/bottom_navbar/bloc/bottom_navbar_bloc.dart';
import "package:flutter_bloc_app_1/presentation/bottom_navbar/bloc/bottom_navbar_event.dart";

Widget bottomNavBar=BlocBuilder<BottomNavBloc,int>(
  builder: (context,state) {
    return BottomNavigationBar(
            currentIndex: state,
            onTap:(index){
              BlocProvider.of<BottomNavBloc>(context).add(screenChange(index));
              Navigator.of(context).pushNamed((state==0)?"/counter":"/conversion");
            },
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.one_k_outlined),label:"First_Page"),
            BottomNavigationBarItem(icon:Icon(Icons.translate),label:"Convertor")
          ],);
  }
);
