
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/Logic/Bloc/AppCubit/states.dart';
import 'package:social/UI/Screens/Home/Pages/HomIneer.dart';
import 'package:social/UI/Screens/Home/Pages/notifications.dart';
import 'package:social/UI/Screens/Home/Pages/post.dart';
import 'package:social/UI/Screens/Home/Pages/profile.dart';
import 'package:social/UI/Screens/Home/Pages/settings.dart';

class AppCubit extends Cubit<AppStates>{

  //first initialize the initial state for my cybit
  AppCubit() : super(InitialState());

  //create object
  static AppCubit get(context) => BlocProvider.of(context);

  //list of my pages which home will direct to it
  List<Widget> screens = [
    Home2(),
    Settings(),
    Post(),
    Notifications(),
    Profile(),
  ] ;

  //this method change the index of my bottomnavbar to change my screens depend on it
  int CurrentIndex = 0;
  dynamic ChangeIndex(index){
    CurrentIndex = index;
    emit(ChangeBottomState());
  }
}