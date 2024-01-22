import 'package:flutter/material.dart';
import 'package:omra/sqflite.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as LatLng;

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<home> {
  String m = "";

  SqlDb db = SqlDb();
  List users = [];
  @override
  void initState() {
    read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton.outlined(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      side: const BorderSide(width: 0.5, color: Colors.grey),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))))),
            )
          ],
          leading: IconButton.outlined(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  side: const BorderSide(width: 0.5, color: Colors.grey),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))))),
          backgroundColor: Color.fromARGB(200, 0, 0, 0),
          elevation: 0.0,
          toolbarHeight: 90,
        ),
        body: SlidingUpPanel(
          minHeight: 200,
          maxHeight: 200,
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          panel: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: MaterialButton(
                      height: 45,
                      child: const Text(
                        "حالة الخدمة",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                                width: double.infinity,
                                height: 400,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.minimize,
                                            color: Colors.grey,
                                            size: 50,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15, top: 10),
                                            child: Text(
                                              "حالة الطلب",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Text(
                                              "الاحرام",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          Icon(
                                            Icons.circle,
                                            color: Colors.green,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15, top: 10, left: 10),
                                            child: Text("05.05 Am \n 23 Mar"),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Container(
                                                  height: 50,
                                                  width: 270,
                                                  child: Text(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      "وهو واجب من واجبات الاحرام بمعني ان علي من تركه فدية, اما ان يذبح شاة, او صيام"))),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 105),
                                            child: Container(
                                              color: Colors.green,
                                              height: 50,
                                              width: 3,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Text(
                                              "الطواف",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          Icon(
                                            Icons.circle,
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15, top: 10, left: 10),
                                            child: Text("05.05 Am \n 23 Mar"),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Container(
                                                  height: 50,
                                                  width: 270,
                                                  child: Text(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      "وهو واجب من واجبات الاحرام بمعني ان علي من تركه فدية, اما ان يذبح شاة, او صيام"))),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 105),
                                            child: Container(
                                              color: Colors.red,
                                              height: 50,
                                              width: 3,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Text(
                                              "السعي بين الصفا و المروة",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          Icon(
                                            Icons.circle,
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15, top: 10, left: 10),
                                            child: Text("05.05 Am \n 23 Mar"),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Container(
                                                  height: 50,
                                                  width: 270,
                                                  child: Text(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      "وهو واجب من واجبات الاحرام بمعني ان علي من تركه فدية, اما ان يذبح شاة, او صيام"))),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 105),
                                            child: Container(
                                              color: Colors.red,
                                              height: 50,
                                              width: 3,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Text(
                                              "الحلق و التقصير",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                          Icon(
                                            Icons.circle,
                                            color: Colors.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15, top: 10, left: 10),
                                            child: Text("05.05 Am \n 23 Mar"),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Container(
                                                  height: 50,
                                                  width: 270,
                                                  child: Text(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      "وهو واجب من واجبات الاحرام بمعني ان علي من تركه فدية, اما ان يذبح شاة, او صيام"))),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 105),
                                            child: Container(
                                              color: Colors.red,
                                              height: 50,
                                              width: 3,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      )
                                    ],
                                  ),
                                )));
                      },
                      color: const Color.fromRGBO(168, 144, 56, 1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "الصور و الفيديوهات",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.grey[600]),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.store_mall_directory),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 120,
                      height: 130,
                      child: Image.asset(
                        "images/k4.jpeg",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 120,
                      height: 130,
                      child: Image.asset(
                        "images/k1.jpg",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 120,
                      height: 130,
                      child: Image.asset(
                        "images/k2.jpeg",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 120,
                      height: 130,
                      child: Image.asset(
                        "images/k4.jpeg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 120,
                      height: 130,
                      child: Image.asset(
                        "images/k1.jpg",
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
          body: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng.LatLng(37.7749, -122.4194),
              minZoom: 14,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
                tileBuilder: _darkModeTileBuilder,
              ),
              MarkerLayer(markers: [])
            ],
          ),
        ));
  }

  void read() async {
    List<Map> list = await db.readData("SELECT * FROM user");
    users.addAll(list);
    setState(() {});
  }

  Widget _darkModeTileBuilder(
    BuildContext context,
    Widget tileWidget,
    TileImage tile,
  ) {
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        -0.2126, -0.7152, -0.0722, 0, 255, // Red channel
        -0.2126, -0.7152, -0.0722, 0, 255, // Green channel
        -0.2126, -0.7152, -0.0722, 0, 255, // Blue channel
        0, 0, 0, 1, 0, // Alpha channel
      ]),
      child: tileWidget,
    );
  }
}
