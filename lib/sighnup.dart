import './login.dart';
import './roundbutton.dart';
import './utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
const Color myCustomColor = Color(0xFF4E342E);
class sighnupscreen extends StatefulWidget {
  const sighnupscreen({Key? key}) : super(key: key);

  @override
  State<sighnupscreen> createState() => _sighnupscreenState();
}

class _sighnupscreenState extends State<sighnupscreen> {
  bool loading =false;
  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  final formfeild=GlobalKey<FormState>();
  FirebaseAuth auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

     backgroundColor:myCustomColor,
        centerTitle: true,

        title:Text(
            'Sign up '
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
                              color:myCustomColor,

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
                        color: myCustomColor,
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
            roundbutton(title: 'sign up',
                loading:loading,
                onTap:(){
                  if(formfeild.currentState!.validate ()){
                    setState(() {
                      loading=true;

                    });
                    auth.createUserWithEmailAndPassword(
                        email: emailcontroller.text.toString(),
                        password: passwordcontroller.text.toString()).then((value){
                      setState(() {
                        loading=false;

                      });
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                      setState(() {
                        loading=false;

                      });

                    });


                  }
                }),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?" ),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>loginsreen()));
                }, child: Text(
                  'login',
                  style: TextStyle(color: myCustomColor),

                ))
              ],
            )

          ]
      ),
    );
  }
}
