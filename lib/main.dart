import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:social/Logic/Bloc/Auth/AuthBloc.dart';
import 'package:social/Logic/Bloc/blocobserver.dart';
import 'package:social/UI/Screens/Home/home.dart';
import 'package:social/UI/Screens/Welcome/Welcome.dart';
import 'package:social/UI/Themes/DarkTheme.dart';
import 'package:social/UI/Themes/LightTheme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  runApp(Social());

  //this function change the status bar style (color , icon brightness , ...)
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
}
class Social extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
          theme:LightTheme.lightTheme,
        ),
    );
  }
}
