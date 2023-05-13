// ignore: depend_on_referenced_packages

// You should do these steps

// to save the object:

// convert your object to map with toMap() method
// encode your map to string with encode(...) method
// save the string to shared preferences
// for restoring your object:

// decode shared preference string to a map with decode(...) method
// use fromJson() method to get your object

import 'dart:convert';

class MyModel {
  final int id;
  String name;
  int number=0;

  MyModel({required this.id, required this.name, required this.number});

  factory MyModel.fromJson(Map<String, dynamic> jsonData) {
    return MyModel(
      id: jsonData['id'],
      name: jsonData['name'],
      number: jsonData['number'],
    );
  }

  static Map<String, dynamic> toMap(MyModel mymodel) => {
        'id': mymodel.id,
        'name': mymodel.name,
        'number': mymodel.number,
      };

  static String encode(List<MyModel> mymodels) => json.encode(
        mymodels
            .map<Map<String, dynamic>>((mymodel) => MyModel.toMap(mymodel))
            .toList(),
      );

  static List<MyModel> decode(String mymodels) =>
      (json.decode(mymodels) as List<dynamic>)
          .map<MyModel>((item) => MyModel.fromJson(item))
          .toList();
}
