// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ListItem.dart';
import 'my_model.dart';

// ignore: camel_case_types
class Editsettings extends StatefulWidget {
  // ignore: non_constant_identifier_names

  String name_Comp;
  String number_Comp;
  int index_Comp;

  Editsettings({
    super.key,
    required this.name_Comp,
    required this.number_Comp,
    required this.index_Comp,
  });

  @override
  State<Editsettings> createState() => _EditsettingsState();
}

TextEditingController txtcus_name = TextEditingController();
TextEditingController txtcus_count = TextEditingController();

class _EditsettingsState extends State<Editsettings> {
  var _formKey = GlobalKey<FormState>();

  // var id;
  // ignore: prefer_typing_uninitialized_variables
//  var mymodel;

  @override
  initState() {
    super.initState();
    txtcus_name.text = widget.name_Comp;
    txtcus_count.text = widget.number_Comp;

    // ignore: avoid_print
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<listitem>(context);

    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "تعديل الذكر",
                          style: TextStyle(fontSize: 25.0, color: Colors.red),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TextFormField(
                          controller: txtcus_name,
                          decoration: InputDecoration(
                              hintText: "اسم الذكر الكامل ",
                              border: InputBorder.none),
                          validator: (String? value) {
                            if (value!.isEmpty || value.length < 1) {
                              return "الرجاء إدخال الاسم الكامل للذكر المطلوب";
                            }
                          },
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(bottom: 10.0),
                      //   padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(25.0)),
                      //   child: TextFormField(
                      //     controller: txtcus_email,
                      //     keyboardType: TextInputType.emailAddress,
                      //     decoration: InputDecoration(
                      //         hintText: "البريد الالكتروني",
                      //         border: InputBorder.none),
                      //     validator: (String value) {
                      //       if (value.isEmpty &&
                      //           (value.indexOf(".") == -1 ||
                      //               value.indexOf("@") == -1)) {
                      //         return "الرجاء ادخال البريد الالكتروني";
                      //       }
                      //     },
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TextFormField(
                          controller: txtcus_count,
                          // obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "العدد الأعظمي للذكر",
                              border: InputBorder.none),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "الرجاء ادخال العدد الأعظمي للذكر";
                            }
                          },
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(bottom: 10.0),
                      //   padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(25.0)),
                      //   child: TextFormField(
                      //     controller: txtcus_mobile,
                      //     keyboardType: TextInputType.number,
                      //     decoration: InputDecoration(
                      //         hintText: "رقم الهاتف", border: InputBorder.none),
                      //     validator: (String value) {
                      //       if (value.isEmpty || value.length < 5) {
                      //         return "الرجاء ادخال رقم الهاتف";
                      //       }
                      //     },
                      //   ),
                      // ),
                      //  isloading
                      // ? circularProgress()
                      //  :
                      //عند نقر زر حفظ سنضيف كائن و نحدّث اللائحة

                      MaterialButton(
                          onPressed: () {
                            // saveDataCustomer(context, myProvider);
                            // mymodel = MyModel(
                            //   id: 3,
                            //   name: txtcus_name.text,
                            //   number: int.parse(txtcus_count.text),
                            // );

                            myProvider.allUsers[widget.index_Comp].name =
                                txtcus_name.text;
                            myProvider.allUsers[widget.index_Comp].number =
                                int.parse(txtcus_count.text);

                            myProvider.set_shared();
                            myProvider.get_shared();
                            myProvider.add_loading();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            // ignore: sort_child_properties_last
                            child: const Text(
                              "تعديل",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            margin:
                                const EdgeInsets.only(bottom: 10.0, top: 30.0),
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25.0)),
                          )),
                      // Container(
                      //   margin: EdgeInsets.only(top: 10.0),
                      //   alignment: Alignment.bottomCenter,
                      //   child: Text(
                      //       "عند الضغط على الشروط والاحكام انت توافق على قوانين التطبيق"),
                      // )
                    ],
                  ),
                )),
                // Container(
                //   alignment: Alignment.center,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       Text(
                //         "اذا لديك حساب سجل الدخول ؟",
                //         style: TextStyle(color: Colors.black, fontSize: 16.0),
                //       ),
                //       Padding(padding: EdgeInsets.all(10.0)),
                //       GestureDetector(
                //         onTap: () {
                //           Navigator.push(context,
                //               MaterialPageRoute(builder: (context) => Login()));
                //         },
                //         child: Text("دخول",
                //             style:
                //                 TextStyle(color: Colors.red, fontSize: 16.0)),
                //       )
                //     ],
                //   ),
                // )//Container
              ],
            ), //column
          ),
        ));
  }
}
