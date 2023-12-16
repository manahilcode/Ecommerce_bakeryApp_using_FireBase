import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled6/secondscreen.dart';
import 'package:untitled6/sixth.dart';
import 'package:untitled6/third.dart';

import 'fifth.dart';
import 'fourth.dart';

const Color myCustomColor = Color(0xFF4E342E);
const Color myCustomColors = Color(0xFFEEEEEE);
List<Map<String, dynamic>> data = [

  {
    'image':
    'assets/bak5.jpg',
    'text': 'Brownies',
    "icon": const Icon(
      Icons.add_box,
      size: 30,
      color: myCustomColor,
    ),
    "screen":  secondscreen(),
  },
  {
    'image':
    'assets/bak6.jpg',
    'text': "Chocolate Cake",
    "icon": const Icon(
      Icons.add_box,
      size: 30,
      color: myCustomColor,
    ),
"screen":  thirdscreen(),
  },
  {
    'image':
    'assets/bak7.jpg',
    'text': "Coffee cake",
    "icon":IconButton(
      iconSize: 30,
      color: myCustomColor,
      icon: const Icon(Icons.add_box),
      onPressed: () {

      },
    ),
"screen":  fourthscreen(),
  },
  {
    'image':
    'assets/bak8.jpg',
    'text': "Choco Pastery",
    "icon":IconButton(
      iconSize: 30,
      color: myCustomColor,
      icon: const Icon(Icons.add_box),
      onPressed: () {

      },
    ),

"screen":  fifthscreen(),
  },
  {
    'image':
    'assets/bak9.jpg',
    'text': "Dark Choclate cake",
    "icon":IconButton(
      iconSize: 30,
      color: myCustomColor,
      icon: const Icon(Icons.add_box),
      onPressed: () {

      },
    ),
    "screen":  sixthscreen(),

  },
];
List<Map<String, dynamic>> data1 = [
  { 'text':'with brown suger layer'},
  { 'text': 'with brown choco layer',},
  { 'text': 'with coffee layer',},
  { 'text': 'with triple choco layer'},
  { 'text': 'with brown choco layer',},

];
List<Map<String, dynamic>> data2 = [
  { 'text':'120/-'},
  { 'text':'1200/-'},
  { 'text':'1600/-'},
  { 'text':'180/-'},
  { 'text':'1400/-'},


];


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color:myCustomColor,size: 30,),
            label:('Home'),
            backgroundColor:Colors.white,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,color:Colors.grey,size: 30,),
            label:('search'),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.notifications,color:Colors.grey,size: 30,),
            label:('cart'),
            backgroundColor:Colors.white,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info,color:Colors.grey,size: 30,),
            label:('help'),
            backgroundColor:Colors.white,
          ),
        ],
      ),

      body: SafeArea(
        top: false,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                height: 350,
                child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        height: 300,
                        width: 600,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.black87, Colors.black, Colors.grey],
                              // specify the desired colors
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              //stops:[0.3,0.7],
                            ),
                          ),),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom:0),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 150,
                                width: 330,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.brown),
                                child: ClipRRect(
                                  child: Image(
                                    image: AssetImage('assets/bak4.jpg'),
                                    fit: BoxFit.cover,

                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  width: 60,
                                  height: 30,

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.red),
                                  child: Center(
                                    child: Text('Promo',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 60.0, left: 15),
                                child: Text('Buy one get',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),),
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.only(top: 90.0, left: 15),
                                child: Text('One free',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50, left: 13),
                                child: Text(
                                  "Location",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.only(left: 13.0),
                                child: Text(
                                  "Bilzen,Tanjungbalai ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17, fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50, right: 5),
                            child: CircleAvatar(
                              radius: 23,
                              child: ClipOval(
                                child: Image(
                                  image: AssetImage('assets/bak13.jpg'),
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:40.0,right: 5,left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Set alignment of containers in the row
                  children: [
                    Expanded(
                      child: Container(
                        height: 38,
                        width: 45,
                        child: Center(
                          child: Text(
                            'Brownies',style:TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: myCustomColors
                          ),

                          ),
                        ),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: myCustomColor,),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(child:Container(
                      height: 38,
                      width: 35,
                      child: Center(
                        child: Text(
                          'Pastry',style:TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: myCustomColor
                        ),

                        ),
                      ),
                      // Set height of containers

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: myCustomColors),// Set color of containers
                    ),
                    ),

                    SizedBox(width: 5,),
                    Expanded(child:Container(
                      height: 38,
                      width: 35,
                      child: Center(
                        child: Text(
                          'Cake',style:TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: myCustomColor
                        ),

                        ),
                      ),


                      decoration: BoxDecoration(
                        color: myCustomColors,
                        borderRadius: BorderRadius.circular(7),),
                    ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Container(
                        height: 38,
                        width: 35,
                        child: Center(
                          child: Text(
                            'Cupcake',style:TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: myCustomColor
                          ),

                          ),
                        ),


                        decoration: BoxDecoration(
                          color: myCustomColors,
                          borderRadius: BorderRadius.circular(7),),
                      ),
                    ),


                  ],
                ),
              ),

              Flexible(

                child: GridView.builder(
                  scrollDirection: Axis.vertical,


                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // set the number of containers in a row
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color:myCustomColors,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Image.asset(
                                data[index]['image'],
                                fit:BoxFit.fitWidth,
                                height: 98,
                                width: 200,

                              ),
                            ), // display image
                            Expanded(
                              child: Center(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        data[index]['text'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        data1[index]['text'],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                data2[index]['text'],
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 8.0),
                                                child: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                          data[index]["screen"],
                                                        ));
                                                  },
                                                  icon: data[index]['icon'],
                                                ),
                                              )
                                            ]
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ),

                          ],

                        ),
                      ),
                    );
                  },
                ),
              ),
            ]
        ),
      ),
    );
  }
}
