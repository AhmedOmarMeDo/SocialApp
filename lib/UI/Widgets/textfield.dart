import 'package:flutter/material.dart';
import 'package:social/UI/constants.dart';

class DefaultTextField extends StatelessWidget {
  var controller;
  String errormsg;
  String hint;
  var ContainerWidth;
  var ContainerHeight;
  var fontwidth;
  Function IconTap;
  Function validatefun;
  IconData suffix;
  bool obs = false;
  var keyboardtype;
  DefaultTextField({this.controller,this.hint,this.errormsg,this.ContainerHeight,this.ContainerWidth,this.fontwidth,this.suffix,this.IconTap,this.validatefun,this.keyboardtype,this.obs=false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ContainerWidth,
      height: ContainerHeight,
      child: TextFormField(
        obscureText: obs,
        style: TextStyle(color: Colors.grey[600],fontSize: fontwidth,decoration:TextDecoration.none,),
        cursorColor: PrimaryColor,
        validator: (String value){
          if(value.isEmpty){
            return errormsg;
          }
          return null;
        },
        controller: controller,
        keyboardType: keyboardtype,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            height: .05,
          ),
          suffixIcon: IconButton(
            onPressed: IconTap ,
            padding: EdgeInsets.zero,
            icon: Icon(suffix),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 0,color: Colors.grey[200]),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 0,color: Colors.grey[200]),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 0,color: Colors.grey[200]),
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey,fontSize: fontwidth),
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 0,color: Colors.grey[200]),
          ),
        ),

      ),
    );
  }
}
