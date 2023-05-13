import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var myarr_category = [];
  bool loadingCategory = false;

//   getCategoryData() async {
//     loadingCategory = true;
//     setState(() {});
//     List arr = await getData(0, 100, "category/readcategory.php", "", "");
//     for (int i = 0; i < arr.length; i++) {
//       myarr_category.add({
//         "cat_id": arr[i]["cat_id"],
//         "cat_name": arr[i]["cat_name"],
//         "cat_image": arr[i]["cat_thumbnail"] == null
//             ? "def.png"
//             : arr[i]["cat_thumbnail"]
//       });
//     }
//     loadingCategory = false;
//     setState(() {});
//   }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    // getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "قائمة الأذكار ",
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      //تحويل لعمود يحوي زر و لائحة
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: ListView.builder(
            itemCount: myarr_category.length,
            itemBuilder: (BuildContext context, int index) {
              return SingleCategory(
                  cat_id: myarr_category[index]["cat_id"],
                  cat_image: myarr_category[index]["cat_image"],
                  cat_name: myarr_category[index]["cat_name"]);
            }),
      ),
    );
  }
}

class SingleCategory extends StatelessWidget {
  final String cat_id;
  final String cat_name;
  final String cat_image;

  SingleCategory(
      {required this.cat_id, required this.cat_name, required this.cat_image});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.red[100]),
                child: cat_image == null || cat_image == ""
                    ? CachedNetworkImage(
                        height: 64.0,
                        width: 64.0,
                        fit: BoxFit.cover,
                        imageUrl: "def.png",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
                    : CachedNetworkImage(
                        height: 64.0,
                        width: 64.0,
                        fit: BoxFit.cover,
                        imageUrl: cat_image,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
              ),
              title: Text(
                cat_name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Divider(),
        ],
      ), //column
    );
  }
}

CachedNetworkImage(
    {required double height,
    required double width,
    required BoxFit fit,
    required imageUrl,
    required CircularProgressIndicator Function(dynamic context, dynamic url)
        placeholder,
    required Icon Function(dynamic context, dynamic url, dynamic error)
        errorWidget}) {}
