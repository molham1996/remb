import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ListItem.dart';
import 'my_model.dart';
import 'my_card.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  //bool isloading = false;

  var _formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  TextEditingController txtcus_name = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController txtcus_count = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  var id;
  // ignore: prefer_typing_uninitialized_variables
  var mymodel;
  //TextEditingController txtcus_mobile = new TextEditingController();
  //TextEditingController txtcus_email = new TextEditingController();

  // saveDataCustomer(context, LoadingControl load) async {
  //   if (!await checkConnection()) {
  //     Toast.show("Not connected Internet", context,
  //         duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  //   }
  //   bool myvalid = _formKey.currentState.validate();
  //   load.add_loading();
  //   if (myvalid) {
  //     isloading = true;
  //     load.add_loading();
  //     // Map arr = {
  //     //   "cus_name": txtcus_name.text,
  //     //   "cus_pwd": txtcus_count.text,
  //     //   "cus_mobile": txtcus_mobile.text,
  //     //   "cus_email": txtcus_email.text,
  //     // };

  //     // Map resArray = await SaveDataList(
  //     //     arr, "customer/insert_customer.php", context, "insert");
  //     isloading = resArray != null ? true : false;
  //     if (isloading) {
  //       SharedPreferences sh = await SharedPreferences.getInstance();
  //       sh.setString(G_cus_id, resArray["cus_id"]);
  //       sh.setString(G_cus_name, resArray["cus_name"]);
  //       sh.setString(G_cus_image, resArray["cus_image"]);
  //       sh.setString(G_cus_mobile, resArray["cus_mobile"]);
  //       sh.setString(G_cus_email, resArray["cus_email"]);
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => Home()));
  //     }
  //     /*await createData(
  //         arr, "delivery/insert_delivery.php", context, () => Delivery());*/

  //     load.add_loading();
  //   } else {
  //     Toast.show("Please fill data", context,
  //         duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  //   }
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    txtcus_name.dispose();
    txtcus_count.dispose();
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
                          "إدخال أذكار",
                          style: TextStyle(fontSize: 25.0, color: Colors.red),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        child: Text(
                          "جديدة ",
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
                            mymodel = MyModel(
                              id: 3,
                              name: txtcus_name.text,
                              number: int.parse(txtcus_count.text),
                            );
                            myProvider.add_item(mymodel);

                            myProvider.set_shared();
                            myProvider.get_shared();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "حفظ",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            margin: EdgeInsets.only(bottom: 10.0, top: 30.0),
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
