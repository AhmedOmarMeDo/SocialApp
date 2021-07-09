import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/Logic/Bloc/Auth/AuthBloc.dart';
import 'package:social/Logic/Bloc/Auth/AuthStates.dart';
import 'package:social/UI/Screens/Home/home.dart';
import 'package:social/UI/Widgets/Button.dart';
import 'package:social/UI/Widgets/alertdialog.dart';
import 'package:social/UI/Widgets/textfield.dart';
import 'package:provider/provider.dart';

class Sign extends StatelessWidget {
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit,AuthStates>(
        listener: (context,state){
          if(state is RegisterLoading){
            Center(child: CircularProgressIndicator(),);
          }else if(state is  SaveSuccess){
            ShowDialogg(context, 'Gongratulations.','assets/images/true.png',()=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()),(route) => false));
          }else  if(state is RegisterFail || state is SaveFail){
            ShowDialogg(context, 'Some thing went wrong or this email addresse already used','assets/images/false.png',() => Navigator.pop(context));
          }
        },
        builder: (context,state){
          AuthCubit object = AuthCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                width: double.infinity,
                child:SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                onPressed: (){Navigator.pop(context);},
                                iconSize: 25,
                              ),
                            ),
                            SizedBox(width: size.width * .25,),
                            Text('Sign Up',style: Theme.of(context).textTheme.headline4,),
                          ],
                        ),
                        Image.asset(
                          'assets/images/Sign.png',
                          width: size.width*.65,
                        ),
                        SizedBox(height: size.height*.01,),
                        DefaultTextField(
                          controller: namecontroller,
                          hint: 'Name',
                          errormsg: 'Enter valid name',
                          fontwidth: size.width * .04,
                          ContainerWidth: size.width*.9,
                          ContainerHeight: size.height*.07,
                        ),
                        SizedBox(height: size.height*.02,),
                        DefaultTextField(
                          controller: emailcontroller,
                          hint: 'Email',
                          errormsg: 'Enter valid email',
                          fontwidth: size.width * .04,
                          ContainerWidth: size.width*.9,
                          ContainerHeight: size.height*.07,
                        ),
                        SizedBox(height: size.height*.02,),
                        DefaultTextField(
                          controller: phonecontroller,
                          hint: 'phone',
                          errormsg: 'Enter valid phone',
                          keyboardtype: TextInputType.number,
                          fontwidth: size.width * .04,
                          ContainerWidth: size.width*.9,
                          ContainerHeight: size.height*.07,
                        ),
                        SizedBox(height: size.height*.02,),
                        DefaultTextField(
                          controller: passcontroller,
                          obs: object.IsObs,
                          IconTap: () {
                            object.ChangeObs();
                          },
                          hint: 'Password',
                          errormsg: 'Enter valid pass',
                          fontwidth: size.width * .04,
                          ContainerWidth: size.width*.9,
                          ContainerHeight: size.height*.07,
                          suffix: object.IsObs == true ? Icons.visibility_off : Icons.visibility,
                        ),
                        SizedBox(height: size.height*.04,),
                        ConditionalBuilder(
                            condition: state is RegisterLoading,
                            builder: (context) => Center(child: CircularProgressIndicator(),),
                            fallback: (context) => Button(
                            text: 'SignUp',
                            textColor: Colors.white,
                            colorbool: true,
                            fun: (){
                              if(formkey.currentState.validate()){
                                object.UserRegister(emailcontroller.text, passcontroller.text, phonecontroller.text);
                              }
                            },
                          ),
                        ),
                        SizedBox(height: size.height*.02,),
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
