import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/utils.dart';
const Color myCustomColor = Color(0xFF4E342E);
class address extends StatefulWidget {


  final double totalBill;
  address({required this.totalBill});


  @override
  State<address> createState() => _addressState();
}

class _addressState extends State<address> {

  final databaseRef = FirebaseDatabase.instance.ref("address");
  final postController = TextEditingController();
  final editController = TextEditingController();
  Color myCustomColor = Color(0xFF4E342E);
  bool loading = false;
   final deliverycharges=80;



  @override
  Widget build(BuildContext context) {
    double totalBillWithDelivery = widget.totalBill + deliverycharges;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Order',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 40, left: 20.0, right: 20, bottom: 10),
            child: TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                hintText: "Enter your address",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Confirm Address'),
            style: ElevatedButton.styleFrom(primary: myCustomColor),

            onPressed: () {
              String id=DateTime.now().minute.toString();
              databaseRef.child(id).set({
                'title': postController.text.toString(),
                'id':id,
              }).then((value) {
                Utils().toastMessage('Your order is confirmed');
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },

          ),
          ListTile(
              title: Text(
                'Delivery Address',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(
                Icons.delivery_dining_outlined,
                color: myCustomColor,
                size: 40,


              )
          ),

          Expanded(
            child: FirebaseAnimatedList(
              query: databaseRef,
              itemBuilder: (context, snapshot, animation, index) {
                final title=(snapshot.child('title').value.toString());
                final id=(snapshot.child('id').value.toString());
                return
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ListTile(
                      title: Text(snapshot.child('title').value.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      trailing: PopupMenuButton(

                          icon: Icon(
                              Icons.menu
                          ), itemBuilder: (context) =>
                      [

                        PopupMenuItem(

                          value: 1,
                          child: ListTile(
                            onTap:(){
                              Navigator.pop(context);
                              showMyDialog(  title,id);
                            } ,
                            leading: Icon(
                                Icons.edit
                            ),
                            title: Text(
                                "edit"
                            ),
                          ),

                        ),
                PopupMenuItem(
                value: 1,
                child: ListTile(
                onTap:(){
                Navigator.pop(context);
                databaseRef.child(snapshot.key!).remove();
                } ,
                leading: Icon(
                Icons.delete
                ),
                title: Text(
                "delate"
                ),
                ),

                )
                      ]


                      ),
                    ),
                  );

              },

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20.0,right:20.0,bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,


              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' Bill:',
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${widget.totalBill.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 24, ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' Delivery charges:',
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                    ),
                    Text(
    '${deliverycharges.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 24, ),
                    ),
                  ],
                ),
                SizedBox(height: 3,),
                Divider(
                  color: Colors.grey, //color of divider
                  height: 5, //height spacing of divider
                  thickness: 1, //thickness of divier line
                  indent: 0, //spacing at the start of divider
                  endIndent: 0,
                ),
                SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' Total',
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${totalBillWithDelivery.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),


              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Eo_circle_brown_checkmark.svg/2048px-Eo_circle_brown_checkmark.svg.png",width: 100,height: 100,),
            ),
          ),
Expanded(child: Center(child: Text("YOUR ORDER HAS BEEN CONFIRMED!",style: TextStyle(fontSize: 20,color: myCustomColor,fontWeight: FontWeight.bold),))),
        ],
      ),
    );
  }

  Future<void> showMyDialog(String title, String id ) async {
    editController.text=title;
    return showDialog(
        context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
            "update"
        ),
        content: Container(
          child: TextField(
            controller: editController,
            decoration: InputDecoration(
              hintText: "edit"
            ),
          ),
        ),
        actions: [
          TextButton( onPressed:(){
            Navigator.pop(context);
          }, child: Text(
              "cancel"
          )),
          TextButton( onPressed:(){
            Navigator.pop(context);
            databaseRef.child(id).update({
              "title":editController.text.toLowerCase()
            }).then((value) {
              Utils().toastMessage("address updated");
            }).onError((error, stackTrace){
              Utils().toastMessage(error.toString());
            });

          },

              child: Text(
            "update"
          ))
        ],
      );
    }
    );
  }
}
