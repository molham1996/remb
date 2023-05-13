import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'settings_page.dart';
import 'Exit_page.dart';
import 'dart:io';
//import '../config.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Container(
      child: Drawer(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          "الصفحة الرئيسية",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.home,
                          color: Colors.red,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[500],
                    ),
                  ],
                ),
              ),
              Theme(
                data: theme,
                child: ExpansionTile(
                  title: Text(
                    "الأذكار",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                  children: <Widget>[
//======================child account
                    // Divider(
                    //   color: Colors.grey[500],
                    // ),
                    Container(
                      padding: EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Settings()));
                            },
                            child: ListTile(
                              title: Text(
                                "تغيير الاعدادات ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                              ),
                              leading: Icon(
                                Icons.settings,
                                color: Colors.red,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 18.0,
                              ),
                            ),
                          ),
                          // Divider(
                          //   color: Colors.grey[500],
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Settings()));
                            },
                            child: ListTile(
                              title: Text(
                                "إضافة ذكر جديد",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                              ),
                              leading: Icon(
                                Icons.add,
                                color: Colors.red,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //======================end child account
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[500],
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          "من نحن",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.message,
                          color: Colors.red,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[500],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          "مركز الدعم",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.phone,
                          color: Colors.red,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[500],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        //logout(context);
                        SystemNavigator.pop();
                      },
                      // ignore: prefer_const_constructors
                      child: ListTile(
                        title: const Text(
                          "خروج",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[500],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
