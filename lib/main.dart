import 'home.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import '/myDrawer_page.dart';
import 'package:provider/provider.dart';
import 'ListItem.dart';
import 'package:splashscreen/splashscreen.dart';
import 'homeview.dart';
import 'notifyListener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _keyDrawer = GlobalKey<ScaffoldState>();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoadingControl>(
            create: (context) => LoadingControl(),
          ),
          ChangeNotifierProvider<listitem>(
            create: (context) => listitem(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(fontFamily: 'GE_ar', primarySwatch: Colors.red),
          home: Splash(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
