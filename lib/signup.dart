import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:omra/home.dart';
import 'package:omra/sqflite.dart';

bool done = false;
String? sel = "user";
bool pass = true;
String? phone = "null";
String? password = "null";
String? password2 = "null";

SqlDb db = SqlDb();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 10),
              child: IconButton.outlined(
                  onPressed: () {
                    exit(0);
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 0.5, color: Colors.grey),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))))),
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 90,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/final.jpg"), fit: BoxFit.fill)),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Center(
                      child: Container(
                          child: Image.asset(
                    "images/log.jpg",
                    height: 85,
                  ))),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "مرحباً بك",
                      style: TextStyle(
                          color: Color.fromRGBO(168, 144, 56, 1.0),
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Center(
                      child: Text(
                        "في تطبيق عمرة للغير لكل من هو غير قادر علي ادائها",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          "التسجيل بصفتي",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 10, top: 10, left: 20),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Radio(
                          value: "user",
                          groupValue: sel,
                          onChanged: (value) {
                            setState(() {
                              sel = value;
                            });
                          },
                          fillColor: MaterialStatePropertyAll(sel == "user"
                              ? const Color.fromRGBO(168, 144, 56, 1.0)
                              : Colors.grey),
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                    width: 2,
                                    color: sel == "user"
                                        ? const Color.fromRGBO(
                                            168, 144, 56, 1.0)
                                        : Colors.grey),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)))),
                            onPressed: () {
                              setState(() {
                                sel = "user";
                              });
                            },
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 45,
                                ),
                                Text(
                                  "مستخدم",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: sel == "user"
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  CupertinoIcons.person_3,
                                  color: Colors.black,
                                  size: 30,
                                )
                              ],
                            )),
                        Radio(
                          value: "store",
                          groupValue: sel,
                          onChanged: (value) {
                            setState(() {
                              sel = value;
                            });
                          },
                          fillColor: MaterialStatePropertyAll(sel == "user"
                              ? Colors.grey
                              : const Color.fromRGBO(168, 144, 56, 1.0)),
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                    width: 2,
                                    color: sel == "user"
                                        ? Colors.grey
                                        : const Color.fromRGBO(
                                            168, 144, 56, 1.0)),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)))),
                            onPressed: () {
                              setState(() {
                                sel = "store";
                              });
                            },
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 45,
                                ),
                                Text(
                                  "مقدم خدمة",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: sel == "user"
                                          ? FontWeight.w500
                                          : FontWeight.bold,
                                      color: sel == "user"
                                          ? Colors.grey
                                          : Colors.black),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.storefront,
                                  color: sel == "user"
                                      ? Colors.grey
                                      : Colors.black,
                                  size: 30,
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20, top: 10),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text("رقم الهاتف",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 26),
                          child: Container(
                            width: 271,
                            child: TextFormField(
                              textDirection: TextDirection.rtl,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromRGBO(
                                              168, 144, 56, 1.0))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  filled: true,
                                  fillColor: Colors.white),
                              onChanged: (value) {
                                phone = value;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                              width: 84,
                              child: const IntlPhoneField(
                                showDropdownIcon: false,
                                disableLengthCheck: true,
                                initialValue: "+966",
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                168, 144, 56, 1.0)))),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 10),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text("كلمة المرور",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 26, top: 10, left: 15),
                        child: Container(
                          width: 370,
                          child: TextFormField(
                            obscureText: pass,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (pass == true) {
                                          pass = false;
                                        } else {
                                          pass = true;
                                        }
                                      });
                                    },
                                    icon: const Icon(
                                        Icons.remove_red_eye_outlined)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromRGBO(168, 144, 56, 1.0))),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                filled: true,
                                fillColor: Colors.white),
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 10),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text("تأكيد كلمة المرور",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 26, top: 10, left: 15),
                        child: Container(
                          width: 370,
                          child: TextFormField(
                            obscureText: pass,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (pass == true) {
                                          pass = false;
                                        } else {
                                          pass = true;
                                        }
                                      });
                                    },
                                    icon: const Icon(
                                        Icons.remove_red_eye_outlined)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color.fromRGBO(168, 144, 56, 1.0))),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                fillColor: Colors.white,
                                filled: true),
                            onChanged: (value) {
                              password2 = value;
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 15),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Radio(
                          value: true,
                          groupValue: done,
                          onChanged: (value) {
                            setState(() {
                              if (done == false) {
                                done = true;
                              } else {
                                done = false;
                              }
                            });
                          },
                          fillColor: const MaterialStatePropertyAll(
                              Color.fromRGBO(168, 144, 56, 1.0)),
                        ),
                        const Text(
                          "انا اوافق علي الشروط و الاحكام و سياسة الخصوصية",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 22, left: 22),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        child: const Text(
                          "تسجيل دخول",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          if (phone != "null" &&
                              password != "null" &&
                              password2 != "null" &&
                              done == true) {
                            if (password == password2) {
                              db.insertData(
                                  "INSERT INTO user(phone,pass) VALUES ($phone,$password)");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => home()));
                            }
                          }
                        },
                        color: const Color.fromRGBO(168, 144, 56, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
