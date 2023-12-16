

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/dashboard_screen.dart';

import 'package:untitled6/roundbutton.dart';
import 'package:untitled6/sighnup.dart';
import 'package:untitled6/utils.dart';




const Color myCustomColor = Color(0xFF4E342E);
const Color myCustomColorss = Color(0xFF5D4037);



class loginsreen extends StatefulWidget {
  const loginsreen({Key? key}) : super(key: key);

  @override
  State<loginsreen> createState() => _loginsreenState();
}

class _loginsreenState extends State<loginsreen> {
  FirebaseAuth auth=FirebaseAuth.instance;
  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  final formfeild=GlobalKey<FormState>();

  @override
  void dispose(){
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }
  void login(){
    auth.signInWithEmailAndPassword(email: emailcontroller.text , password: passwordcontroller.text).then((value){
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(context, MaterialPageRoute(builder:(context)=>DashboardScreen()));
    }).onError((error,stackTrace){
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: myCustomColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title:Text(
            'login'
        ),
      ),
      body: Column(



          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Form(
              key:formfeild,
              child: Column(

                children: [
                  TextFormField(
                      controller: emailcontroller,
                      decoration:const  InputDecoration(
                          hintText: 'Email',

                          prefixIcon: Icon(
                            Icons.email,
                            color: myCustomColor,
                          )
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return'Enter email ';
                        }
                        return null;

                      }
                  ),
                  SizedBox(height: 40,),
                  TextFormField(
                    controller:passwordcontroller,
                    obscureText: true,
                    decoration:const  InputDecoration(
                      hintText: 'Password',


                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color:myCustomColor
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return'Enter password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            roundbutton(title: 'login', onTap:(){
              if(formfeild.currentState!.validate ()){
                login();

              }
            }),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ?" ),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>sighnupscreen()));
                }, child: Text(
                  'signup',
                  style: TextStyle(color:myCustomColor),

                ))
              ],
            )

          ]
      ),
    );
  }
}
