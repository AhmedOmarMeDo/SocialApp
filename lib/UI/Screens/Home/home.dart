import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:social/Logic/Bloc/AppCubit/Cubit.dart';
import 'package:social/Logic/Bloc/AppCubit/states.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
            AppCubit object = AppCubit.get(context);
            return Scaffold(
              bottomNavigationBar: ConvexAppBar(
                style: TabStyle.fixedCircle,
                backgroundColor: Colors.blue[800],
                height: size.height*.065,
                color: Colors.white70,
                activeColor: Colors.white,
                cornerRadius: 15,
                items: [
                  TabItem(icon: Icons.home_sharp ,title: 'Home'),
                  TabItem(icon: Icons.settings ,title: 'Settings'),
                  TabItem(icon: Icons.add),
                  TabItem(icon: Icons.add_alert , title: 'Notification'),
                  TabItem(icon: Icons.account_circle ,title: 'Profile'),
                ],
                initialActiveIndex: object.CurrentIndex,
                onTap: (index){
                  object.ChangeIndex(index);
                },
              ),
              body: object.screens[object.CurrentIndex],
            );
          },
        ),
    );
  }
}
