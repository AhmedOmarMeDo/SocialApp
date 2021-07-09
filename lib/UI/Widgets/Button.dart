import 'package:flutter/material.dart';
import 'package:social/UI/constants.dart';

class Button extends StatelessWidget {
  String text;
  Color colur;
  Color textColor;
  Function fun;
  bool colorbool;
  Button({this.text,this.colur,this.textColor,this.fun,this.colorbool});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width*.9,
      height: size.height*.07,
      
      child: OutlinedButton(
        onPressed: fun,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1.copyWith(color: textColor,fontSize: size.width*.05,fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all( colorbool == true ? PrimaryColor:colur),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }
}
