import 'dart:developer';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social/Logic/Bloc/Auth/AuthBloc.dart';
import 'package:social/Logic/Bloc/Auth/AuthStates.dart';
import 'package:social/UI/Screens/Home/home.dart';
import 'package:social/UI/Screens/Sign/Sign.dart';
import 'package:social/UI/Widgets/Button.dart';
import 'package:social/UI/Widgets/alertdialog.dart';
import 'package:social/UI/Widgets/textfield.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit,AuthStates>(
      listener: (context,state){
        if(state is LoginLoading){
          Center(child: CircularProgressIndicator(),);
        }else if(state is LoginSuccess){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()),(route) => false);
        }else  if(state is LoginFail){
          Center(child: CircularProgressIndicator(),);
           ShowDialogg(context, 'Some thing went wrong please check your email and password again','assets/images/false.png',() => Navigator.pop(context));
        }
      },
      builder: (context,state){
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Image.asset(
                        'assets/images/login2.jpg',
                        width: size.width * .85,
                      ),
                      SizedBox(
                        height: size.height * .08,
                      ),
                      DefaultTextField(
                        hint: 'Email',
                        controller: emailController,
                        errormsg: 'Enter valid email',
                        ContainerWidth: size.width * .9,
                        ContainerHeight: size.height * .07,
                        fontwidth: size.width * .04,
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      DefaultTextField(
                        hint: 'Password',
                        obs: AuthCubit.get(context).IsObs,
                        controller: passController,
                        errormsg: 'Enter valid password',
                        ContainerWidth: size.width * .9,
                        ContainerHeight: size.height * .07,
                        fontwidth: size.width * .04,
                        suffix: AuthCubit.get(context).IsObs == true ? Icons.visibility_off : Icons.visibility,
                        IconTap: () {
                          AuthCubit.get(context).ChangeObs();
                        },
                      ),
                      SizedBox(
                        height: size.height * .04,
                      ),
                      ConditionalBuilder(
                          condition: state is LoginLoading,
                          builder: (context) => Center(child: CircularProgressIndicator(),),
                          fallback:(context) =>Button(
                            text: 'Login',
                            textColor: Colors.white,
                            fun: () async{
                              if (formkey.currentState.validate()) {
                                AuthCubit.get(context).LogIn(emailController.text, passController.text);
                              }
                            },
                            colorbool: true,
                          ),
                      ),
                      SizedBox(
                        height: size.height * .015,
                      ),
                      Container(
                        width: size.width * .9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: Sign(),
                                          type: PageTransitionType.rightToLeft));
                                },
                                child: Text(
                                  'Register',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(color: Colors.blue[600]),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
