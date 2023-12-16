import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/address.dart';

const Color myCustomColor = Color(0xFF4E342E);

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  double totalBill = 0.0;
  final postController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.reference().child("cart");
  final ref = FirebaseDatabase.instance.reference().child("cart");

  @override
  void initState() {
    super.initState();

    // Listen for changes in the "cart" reference
    ref.onChildAdded.listen((event) {
      final price = double.parse(event.snapshot.child('price').value.toString());
      setState(() {
        totalBill += price;
      });
    });

    ref.onChildRemoved.listen((event) {
      final price = double.parse(event.snapshot.child('price').value.toString());
      setState(() {
        totalBill -= price;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myCustomColor,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseRef,
              itemBuilder: (context, snapshot, animation, index) {
                final title = snapshot.child('title').value.toString();
                final price = double.parse(snapshot.child('price').value.toString());

                return ListTile(
                  title: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text(price.toStringAsFixed(2)),
                  trailing: IconButton(
                    iconSize: 28,
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () {
                      ref.child(snapshot.key!).remove();
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            'Total Bill: \$${totalBill.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          ElevatedButton(
            child: Text('Confirm order'),
            style: ElevatedButton.styleFrom(
              primary: myCustomColor,
            ),
            onPressed: () {
              // You can add your logic for confirming the order here.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => address(totalBill: totalBill),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
