
import 'package:flutter/material.dart';
import 'package:sokh/signin_login/signin.dart';





class CustomTextField extends StatefulWidget {
  TextEditingController textController;
  String ErrorMsg;
  String HintText;
  String LabelText;
  IconData fieldIcon;
  CustomTextField({Key? key,
    required this.textController,
    required this.ErrorMsg,
    required this.HintText,
    required this.LabelText,
    required this.fieldIcon,


  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}


class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: widget.textController,
        validator: (inputString){
          if(inputString==null || inputString.isEmpty)
          {
            return widget.ErrorMsg;
          }
          else if(widget.LabelText=="Confirm password"&&signinPassController.text!=signinConfirmPassController.text)
            {
              return "Password doesn't match";
            }
          return null;

        },
        showCursor: true,
        cursorColor: Colors.indigo,
        // cursorHeight: 30,
        decoration: InputDecoration(
          suffixIcon: Icon(widget.fieldIcon,
            color: Colors.black,
          ),
          hintText: widget.HintText,
          label:Text(widget.LabelText),
          labelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800
          ),


          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              //style: BorderStyle.solid,
              width: 2.5,
              color: Colors.indigo,
            ),

            borderRadius: BorderRadius.only(topLeft:Radius.circular(10) ,topRight:Radius.circular(0) ,
                bottomLeft:Radius.circular(0) ,bottomRight:Radius.circular(10) ),
          ),

          enabledBorder:  UnderlineInputBorder(
            borderSide: BorderSide(
              //style: BorderStyle.solid,
              width: 5,
              color: Colors.lightGreen,
            ),


          ),

          errorBorder:UnderlineInputBorder(
            borderSide: BorderSide(
              //style: BorderStyle.solid,
              width: 5,
              color: Colors.red,
            ),

            borderRadius: BorderRadius.only(topLeft:Radius.circular(10) ,topRight:Radius.circular(0) ,
                bottomLeft:Radius.circular(0) ,bottomRight:Radius.circular(10) ),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              //style: BorderStyle.solid,
              width: 2.5,
              color: Colors.red,
            ),

            borderRadius: BorderRadius.only(topLeft:Radius.circular(10) ,topRight:Radius.circular(0) ,
                bottomLeft:Radius.circular(0) ,bottomRight:Radius.circular(10) ),
          ),


        ),
      ),
    );
  }
}