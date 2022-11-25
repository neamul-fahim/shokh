

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sokh/signup_and_login/log_in.dart';
import 'package:sokh/my_home_page/my_home_page.dart';
import 'package:sokh/signup_and_login/sign_in.dart';

class CustomAccountPage extends StatefulWidget {

  String actionName;
  String emailErrorMsg;
  String emailHintText;
  String emailLabelText;
  String passwordErrorMsg;
  String passwordHintText;
  String passwodLabelText;
  String checkForAccount;
  String signupLoginOption;
  int signUpExtra;
  Widget Goto;


   CustomAccountPage({Key? key,
     //required this.actionName,
     string actionName,
     required this.emailErrorMsg,
     required this.emailHintText,
     required this.emailLabelText,
     required this.passwordErrorMsg,
     required this.passwordHintText,
     required this.passwodLabelText,
     required this.checkForAccount,
     required this.signupLoginOption,
     required this.signUpExtra,
     required this.Goto,
   }) : super(key: key){
     this.actionName=actionName;
   }


  @override
  State<CustomAccountPage> createState() => _CustomAccountPageState();
}

  GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

   TextEditingController emailController=TextEditingController();
   TextEditingController passwordController=TextEditingController();
   TextEditingController confirmPasswordController=TextEditingController();


class _CustomAccountPageState extends State<CustomAccountPage> {
  @override
  Widget build(BuildContext context) {

    double dynamicHeight=MediaQuery.of(context).size.height;
    double dynamicWidth=MediaQuery.of(context).size.width;


    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:50 ,bottom: 0,right: 0,left:0 ),
              child: Text(widget.actionName,style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize:35
              ),),
            ),

            SizedBox(
              height: 50,
            ),
            CustomTextField(
                textController: emailController,
                ErrorMsg:widget.emailErrorMsg,
                HintText: widget.emailHintText,
                LabelText: widget.emailLabelText,
                fieldIcon: Icons.email_rounded,
            ),

            CustomTextField(
                textController:passwordController,
                ErrorMsg: widget.passwordErrorMsg,
                HintText: widget.passwordHintText,
                LabelText: widget.passwodLabelText,
                fieldIcon: Icons.remove_red_eye_rounded,
            ),

            if(widget.signUpExtra==1)

              CustomTextField(
                textController:confirmPasswordController,
                ErrorMsg: widget.passwordErrorMsg,
                HintText: 'Retype Your Password',
                LabelText: "Confirm Password",
                fieldIcon: Icons.remove_red_eye_rounded,
          ),


            Padding(
              padding: const EdgeInsets.only(left: 0,right:0 ,top: 2,bottom:0 ),
              child: Container(
                height: dynamicHeight*0.06,
                width: dynamicWidth*0.4,


                child: ElevatedButton(

                    onPressed:() {
                      if(widget.signUpExtra==1)
                        signin(emailController.text,passwordController.text,confirmPasswordController.text,context);
                      else
                     login(emailController.text, passwordController.text,context);//88888888888888888888888888888888888888888
                    },
                    child: Text(widget.actionName)),
              ),
            ),

            //Don't have an account?
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.checkForAccount,style: TextStyle(
                    color: Colors.deepOrangeAccent,),
                  ),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>widget.Goto));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color: Colors.deepOrangeAccent,
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.signupLoginOption),
                          )
                      )
                  ),

                ],
              ),
            ),
            //Don't have an account?


          ],
        ),
      ),

    );
  }
}

  void login(String email,String password,BuildContext context)async{
  if(_formKey.currentState!.validate())
    {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password).then((value) {
               Fluttertoast.showToast(msg: 'Login successful');
               Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));

      }).catchError((erro){
        Fluttertoast.showToast(msg: "Login error");
      });

    }
  }


  void signin(String email,String password,String confirmPassword,BuildContext context)async {
     if(_formKey.currentState!.validate()&& password==confirmPassword)
       {
         await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
           Fluttertoast.showToast(msg: "Signup successful",
           toastLength: Toast.LENGTH_LONG);
           Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
         }).catchError((error){
           Fluttertoast.showToast(msg:error.massage);
         });
       }
  }



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
