import 'package:flutter/material.dart';

class roundbutton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  bool loading;
  roundbutton({Key? key,required this.title,required this.onTap,this.loading=false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.brown,
          //   borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child:loading?CircularProgressIndicator(strokeWidth: 3,color: Colors.white,):
          Text(
            title,style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
