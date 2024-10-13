import 'package:flutter/material.dart';

class BigEventCard extends StatelessWidget {
  BigEventCard(
      {super.key,
      required this.title,
      required this.location,
      required this.date,
      required this.time,
      required this.image});
  String title;
  String location;
  String date;
  String time;
  String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff5E6E58), width: 1),
          color: Colors.white, borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: 250,
                child: Image.asset(image),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 5),
                  Text(
                    location,
                    style: TextStyle(fontSize: 14, color: Color(0xff5E6E58)),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(Icons.date_range),
                  SizedBox(width: 5),
                  Text(
                    date,
                    style: TextStyle(fontSize: 14, color: Color(0xff5E6E58)),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(Icons.timer),
                  SizedBox(width: 5),
                  Text(
                    time,
                    style: TextStyle(fontSize: 14, color: Color(0xff5E6E58)),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 170,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff5E6E58),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Book",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
