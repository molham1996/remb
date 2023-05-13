// ignore_for_file: camel_case_types

import 'dart:js';
import 'my_model.dart';
import 'package:flutter/material.dart';
//import 'package:shard/my_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class listitem with ChangeNotifier {
  //List<MyModel> allUsers = [];
  List<MyModel> allUsers = [
    MyModel(
      id: 0,
      name: "الحمد الله",
      number: 0,
    ),
    MyModel(
      id: 1,
      name: "استغفر الله",
      number: 0,
    ),
    MyModel(
      id: 2,
      name: "اللهم صلي على سيدنا محمد",
      number: 0,
    ),
    MyModel(
      id: 3,
      name: "لا إله إلا الله",
      number: 0,
    ),
  ];
  void add_item(MyModel card) {
    allUsers.add(card);
    //UI  بدونها لن نلاحظ أي تغيير على
    //setState  فهي مثل
    //rebuild Consumer بتعمل
    notifyListeners();
  }

  void remove_item(MyModel card) {
    allUsers.remove(card);
    notifyListeners();
  }

  int getCountItems() {
    return allUsers.length;
  }

  // ignore: non_constant_identifier_names
  void update_item(int index, String name, int number) {
    allUsers[index].name = name;
    allUsers[index].number = number;
    print(name);
    // add_item(card);
    notifyListeners();
  }

//نعيد اللائحة في حال كنا نريد المرور بحلقة عليها
  List<MyModel> get allUsersList {
    return allUsers;
  }

  void add_loading() {
    // CONSUMER  لل  REBUILD تعمل
    notifyListeners();
  }

  void clear_shared_pref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.clear();
    await prefs.remove('users_key');
    notifyListeners();
  }

  void set_shared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Encode and store data in SharedPreferences
    String encodedData = MyModel.encode(
      allUsers,
      //  for(int i=0;i<myProvider.allUsers.length;i++)
      //  {myProvider.allUsers[i],}
    );
    await prefs.setString('users_key', encodedData);
    notifyListeners();
  }

  void get_shared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Fetch and decode data

    String? usersString = await prefs.getString('users_key');
    // final List<MyModel> users = MyModel.decode(usersString!);
    if (!(usersString == null)) {
      //allUsers.clear();
      allUsers = MyModel.decode(usersString);
    }
    notifyListeners();
    //allUsers = users;
  }
}
