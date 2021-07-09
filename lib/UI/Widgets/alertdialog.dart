import 'package:flutter/material.dart';

Future ShowDialogg(BuildContext context,text,image,Function fun) => showDialog(
  context: context,
  builder: (context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal:30),
    child: AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Center(child: Image.asset(image,width:60,height: 60,)),
      content: Text(text,style: TextStyle(fontSize: 17),textAlign: TextAlign.center,),
      actions: [
        TextButton(
            onPressed: fun,
            child: Text('ok',style: TextStyle(color: Colors.white,fontSize: 17),),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
        ),
      ],
    ),
  ),
);