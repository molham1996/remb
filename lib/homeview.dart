// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'editcompononent..dart';
import 'myDrawer_page.dart';
import 'settings_page.dart';

import 'ListItem.dart';
import 'editcompononent..dart';
import 'my_card.dart';
import 'my_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _keyDrawer = GlobalKey<ScaffoldState>();
  late int index;
  late String name;
  late String number;

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<listitem>(context);
    // var myProvider = Provider.of<listitem>(context);

    return Scaffold(
      key: _keyDrawer,
      endDrawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("تطبيق الأذكار الفريد"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu  Icon',
            onPressed: () {
              _keyDrawer.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      /*? رح يستمع لمين Consumer لازم نحدد
      بما أنني أريد إضافة كرت لذا سنضيف للائحة الكروت و بالتالي سنحدد كلاس مجموعة الكروت هو الذي سنستمع له
      لأننا نريد أخذ تابع لحساب طول اللائحة
      */
/*
الحاوي الذي سيتم إعادة بنائه
list_item : من خلاله نستطيع الوصول للببيانات
 */
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 150,
        ),
        itemCount: myProvider.allUsers.length,
        itemBuilder: (context, i) => MyCard(
          model: myProvider.allUsersList[i],
          onTapAdd: (MyModel newUserData) {
            //  myProvider.add_item(newUserData);

            /// do whatever you want with new data recieved after clicked and user number added one more
            //go to editAddSettings

            myProvider.set_shared();
            myProvider.get_shared();
          },
          onTapDelete: (MyModel newUserData) {
            myProvider.remove_item(newUserData);

            myProvider.set_shared();
            myProvider.get_shared();
          },
          onTapEditing: (MyModel newUserData) {
            index = i;
            name = myProvider.allUsersList[i].name;
            number = myProvider.allUsersList[i].number.toString();

            _sendDataToSecondScreen(context);
          },
        ),
      ), //GridView builder
    ); //scaffold
    //); //ChangeNotifierProvider
    //body
  }

  void _sendDataToSecondScreen(BuildContext context) {
    var myProvider;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Editsettings(
            index_Comp: index,
            name_Comp: name,
            number_Comp: number,
          ),
        ));
  }
}
