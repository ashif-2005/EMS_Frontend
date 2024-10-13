import 'package:flutter/material.dart';

class RowContainer extends StatelessWidget {
  RowContainer({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xff5E6E58), width: 1),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.all(7),
          child: Text(title, style: TextStyle(fontSize: 15),),
        ))
      ),
    );
  }
}
