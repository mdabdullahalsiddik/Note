import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notepad/models/note_model.dart';
import 'package:notepad/pages/add_note_page.dart';

import 'edit_note_page.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  List<NoteModel>? itemList;
  String? title;
  var date;
  HomePage({this.itemList, this.title, this.date, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NoteModel> titleList = [];
  List colorList = [
    Colors.tealAccent.shade400,
    Colors.amber.shade300,
    Colors.red.shade300,
    Colors.green.shade300,
    Colors.blue.shade300,
    Colors.blueGrey.shade300,
    Colors.brown.shade300,
    Colors.cyan.shade300,
  ];
  var color;

  @override
  void initState() {
    super.initState();
    titleList = widget.itemList ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            titleSpacing: 0,
            elevation: 0,
            backgroundColor: Colors.tealAccent.shade400,
            iconTheme: IconThemeData(color: Colors.tealAccent.shade400),
            leading: Center(
              child: Icon(
                Icons.book,
                color: Colors.black,
              ),
            ),
            title: Text(
              "NotePad",
              style: TextStyle(color: Colors.black),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ]),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.tealAccent.shade400,
            child: const Text(
              "Add",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteTextPage(titleList: titleList),
                  ));
            }),
        body: MasonryGridView.count(
          itemCount: titleList.length,
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            for (int i = 1; i < colorList.length; i++) {
              color = colorList[index % i];
            }
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteTextEidtPage(
                          index: index,
                          titleList: titleList,
                          dateTime: widget.date),
                    ));
              },
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Row(
                          children: [
                            Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Delete Item"),
                          ],
                        ),
                        content: const Text("Are you sure"),
                        actions: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.tealAccent.shade400)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(color: Colors.black),
                              )),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.tealAccent.shade400)),
                              onPressed: () {
                                setState(() {
                                  titleList.removeAt(index);
                                  Navigator.pop(context);
                                });
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      );
                    });
              },
              child: Card(
                color: color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        titleList[index].dateTime.toString(),
                        //  maxLines: 7,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          titleList[index].noteTitle.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        titleList[index].noteText.toString(),
                        //  maxLines: 7,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
