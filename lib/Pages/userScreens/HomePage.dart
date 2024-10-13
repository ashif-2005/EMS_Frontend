import 'dart:convert';

import 'package:event_management/Pages/userScreens/rowContainer.dart';
import 'package:event_management/Pages/userScreens/drawerCard.dart';
import 'package:event_management/Pages/userScreens/EventCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<dynamic>> fetchData() async{
    http.Response res = await http.get(Uri.parse("https://ems-backend-eeue.onrender.com/event/get"));
    var decode = jsonDecode(res.body);
    return decode["message"];
  }

  void initState() {
    super.initState();
    print("in initstate");
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff1efe7),
        appBar: AppBar(
          backgroundColor: Color(0xff485551),
          foregroundColor: Colors.white,
          title: Text(
            "Happening",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Color(0xfff1efe7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: DrawerHeader(
                      child: Image.asset(
                        "assets/Logo.png",
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  DrawerCard(
                    text: "My Profile",
                    icon: Icons.person,
                    onTap: () {Navigator.pop(context);},
                  ),
                  DrawerCard(text: "Message", icon: Icons.message, onTap: () {Navigator.pop(context);}),
                  DrawerCard(
                      text: "Calender",
                      icon: Icons.calendar_month,
                      onTap: () {Navigator.pop(context);}),
                  DrawerCard(text: "Bookmark", icon: Icons.bookmark, onTap: () {Navigator.pop(context);}),
                  DrawerCard(
                      text: "Settings",
                      icon: Icons.settings_outlined,
                      onTap: () {Navigator.pop(context);}),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: DrawerCard(text: "Logout", icon: Icons.logout, onTap: () {Navigator.pop(context);}),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                     left: 5, right: 5, bottom: 7),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff5E6E58), width: 1),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(15),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                          color: Color(0xff5E6E58), fontSize: 14),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          'assets/Search.svg',
                          color: Color(0xff5E6E58),
                        ),
                      ),
                      suffixIcon: Container(
                        width: 100,
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const VerticalDivider(
                                color: Color(0xff5E6E58),
                                indent: 10,
                                endIndent: 10,
                                thickness: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/Filter.svg',
                                  color: Color(0xff5E6E58),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none)),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      RowContainer(title: "All"),
                      RowContainer(title: "Hackathon"),
                      RowContainer(title: "WorkShop"),
                      RowContainer(title: "Music"),
                      RowContainer(title: "Dance"),
                      RowContainer(title: "Education"),
                      RowContainer(title: "Party"),
                      RowContainer(title: "Comedy"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: fetchData(), // Fetch data
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Container(height:200, width: 200, child:Lottie.asset("assets/animation4.json"))); // Show loading text
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}')); // Show error if any
                  } else if (snapshot.hasData) {
                    // When data is fetched
                    List<dynamic> items = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return EventCard(title: items[index]["userName"], isBookmarked: true);
                      },
                    );
                  } else {
                    return Center(child: Text('No Data Found'));
                  }
                },
              ),
            ),
            ],
          ),
        ));
  }
}
