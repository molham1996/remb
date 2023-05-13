// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:flutter/material.dart';
import 'settings_page.dart';

// ignore: unused_import
import 'config.dart';
import 'my_model.dart';

class MyCard extends StatefulWidget {
  final MyModel model;
  final Function(MyModel newModelData) onTapAdd;
  final Function(MyModel newModelData) onTapDelete;
  final Function(MyModel newModelData) onTapEditing;

  MyCard({
    Key? key,
    required this.model,
    required this.onTapAdd,
    required this.onTapDelete,
    required this.onTapEditing,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  void initState() {
    super.initState();
  }

  // Loading counter value on start

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            child: Column(children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.onTapDelete(widget.model);
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        alignment: Alignment.center,
                        width: 24,
                        height: 24,
                        child: const Icon(
                          Icons.close,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.onTapEditing(widget.model);
                      });
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        alignment: Alignment.center,
                        width: 24,
                        height: 24,
                        child: const Icon(
                          Icons.settings,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.model.number++;
                });
                widget.onTapAdd(widget.model);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.model.name}",
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 800,
                    height: 101,
                    child: Text(
                      "${widget.model.number}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: 'arial'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ); //
  }
}
