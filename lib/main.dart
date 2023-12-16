import 'package:flutter/material.dart';
import 'package:untitled6/login.dart';
import './sighnup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(

  MaterialApp(
    home: bakery(),
    debugShowCheckedModeBanner: false,
  )

  );
}
class bakery extends StatefulWidget {
  const bakery({Key? key}) : super(key: key);

  @override
  State<bakery> createState() => _bakeryState();
}

class _bakeryState extends State<bakery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: 1300,
            child: Image(
                image: AssetImage('assets/bak1.jpg'),
                fit:BoxFit.cover
            ),

          ),
          // SizedBox(height: 600,),
          Padding(
            padding: const EdgeInsets.only(top:250.0,left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text('Exploring'
                  ,style: TextStyle(
                    color: Colors.white,
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,),
                ),

                SizedBox(height: 2,),
                Text('The',style: TextStyle(
                  color: Colors.white,
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,),
                ),

                SizedBox(height: 2,),
                Text('Magic',style: TextStyle(
                  color: Colors.white,
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,),
                ),

                SizedBox(height: 2,),
                Text('of',style: TextStyle(
                  color: Colors.white,
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,),
                ),

                SizedBox(height: 2,),
                Text('Chocolate',style: TextStyle(
                  color: Colors.white,
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,),
                ),

                SizedBox(height: 2,),
                Text('Cake',style: TextStyle(
                  color: Colors.white,
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 37.0,left: 33),
                  child: Text('Flour,Suger,eggs and love-the basic'
                    ,style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0,left:80),
                  child: Text('recipe for a delightful life.'
                    ,style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const loginsreen()));
                    });
                  },
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top:45.0,right: 20),
                        child: Container(

                          height: 70,
                          width: 400,

                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,

                          ),
                          child:Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:10.0,bottom:10,left: 35),
                                child: Image(
                                  image: AssetImage('assets/bak2.jpg'),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Text("Continue With Google",style:TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.bold),),
                              ),


                            ],
                          ),

                        )
                    ),
                  ),
                ),




              ],
            ),
          ),
          // Container(
          // color: Colors.white,
          //  ),


        ],
      ),

    );
  }
}
