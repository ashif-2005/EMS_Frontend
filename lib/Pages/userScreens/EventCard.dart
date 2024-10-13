import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.title, required this.isBookmarked});
    
    final String title;
    final bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
       decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
       ),
       child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
                children: [
                Icon(Icons.account_circle),
                SizedBox(width: 10,),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
              Icon(Icons.toc_rounded)
            ]),
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset("assets/Event.jpg"),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(children: [
                Icon(Icons.favorite),
                SizedBox(width: 20,),
                Icon(Icons.message_rounded),
                SizedBox(width: 20,),
                Icon(Icons.send),
              ]),
              isBookmarked ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border)
            ]),
          )
        ]),
      ),
    );
  }
}