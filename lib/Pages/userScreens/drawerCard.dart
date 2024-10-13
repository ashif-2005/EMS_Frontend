import 'package:flutter/material.dart';

class DrawerCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  const DrawerCard(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: ListTile(
        leading: Icon(
          icon,
          color: Color(0xff5E6E58),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xff5E6E58),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
