import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:untitled6/utils.dart';
import './cart.dart';

int _count = 0;
const Color myCustomColor = Color(0xFF4E342E);
const Color myCustomColorss = Color(0xFF5D4037);

class fifthscreen extends StatefulWidget {
  fifthscreen({Key? key}) : super(key: key);
  final databaseRef = FirebaseDatabase.instance.ref("cart");
  final postController = TextEditingController();
  bool loading = false;

  @override
  State<fifthscreen> createState() => _fifthscreenState();
}

class _fifthscreenState extends State<fifthscreen> {
  int myString = _count * 180; // Moved inside the State class.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_border_outlined),
            color: Colors.black87,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 170,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.brown,
                ),
                child: ClipRRect(
                  child: Image(
                    image: AssetImage('assets/bak8.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 10),
              child: Text(
                'Choco Pastery',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 32),
              child: Text(
                'with red berries',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.brown,
                  ),
                  child: ClipRRect(
                    child: Image(
                      image: AssetImage('assets/bak10.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: myCustomColorss,
                    ),
                    child: ClipRRect(
                      child: Center(
                        child: Icon(
                          Icons.rate_review_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Divider(
                color: Colors.grey, //color of divider
                height: 5, //height spacing of divider
                thickness: 1, //thickness of divier line
                indent: 25, //spacing at the start of divider
                endIndent: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 15, bottom: 8),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 3, bottom: 8),
              child: Text(
                'The cake is perfectly layered with a lusciously smooth and creamy chocolate frosting. As you cut into it, the velvety frosting spreads smoothly and creates a beautiful contrast against the deep, dark cake layers. The frosting compliments the cake perfectly, adding a touch of sweetness and an extra layer of chocolatey goodness.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, bottom: 8),
              child: Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.add,
                              color: myCustomColor, size: 25.0),
                          onPressed: () {
                            setState(() {
                              _count++;
                              myString = _count * 1200;
                            });
                          }),
                      Text('$_count', style: const TextStyle(fontSize: 24)),
                      IconButton(
                          icon: const Icon(Icons.remove,
                              color: myCustomColor, size: 25.0),
                          onPressed: () {
                            setState(() {
                              if (_count > 0) {
                                _count--;
                                myString = _count * 1200;
                              }
                            });
                          }),
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 8),
                  child: Text(
                    "price",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 152, right: 8, top: 10),
                  child: Container(
                    width: 120,
                    child: ElevatedButton(
                        child: Text('Buy Now'),
                        style: ElevatedButton.styleFrom(
                          primary: myCustomColor,
                        ),
                        onPressed: () {
                          widget.databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                            'title' : 'Choco Pastery',
                            'id' : DateTime.now().millisecondsSinceEpoch.toString(),
                            'price':'$myString',
                          }).then((value){
                            Utils().toastMessage('your product is sucessfully added to cart ');
                          }).onError((error, stackTrace){
                            Utils().toastMessage(error.toString());
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => cart(),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Text(
                '$myString',
                style: TextStyle(
                    fontSize: 20,
                    color: myCustomColor,


                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
