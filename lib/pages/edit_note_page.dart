import 'package:flutter/material.dart';
import 'package:notepad/models/note_model.dart';

import 'homa_page.dart';

// ignore: must_be_immutable
class NoteTextEidtPage extends StatefulWidget {
  int? index;
  List<NoteModel>? titleList;
  DateTime? dateTime;
  NoteTextEidtPage(
      {required this.titleList,
      required this.index,
      required this.dateTime,
      super.key});

  @override
  State<NoteTextEidtPage> createState() => _NoteTextEidtPageState();
}

class _NoteTextEidtPageState extends State<NoteTextEidtPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();

  List<NoteModel> list = [];
  @override
  void initState() {
    int a = widget.index!.toInt();
    list = widget.titleList!.toList();
    titleController.text = widget.titleList![a].noteText.toString();
    textController.text = widget.titleList![a].noteTitle.toString();
    super.initState();
  }

  addData() {
    list.removeAt(widget.index!.toInt());
    list.add(
      NoteModel(
        noteTitle: titleController.text,
        noteText: textController.text,
        dateTime: DateTime.now().toString().substring(0, 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.tealAccent.shade400,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent.shade400,
        onPressed: () {
          addData();

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  itemList: list,
                ),
              ));
        },
        child: const Text(
          "Update",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "Note Title",
                style:
                    TextStyle(color: Colors.tealAccent.shade400, fontSize: 18),
              ),
              const SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Note Title",
                  hintStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey)),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Note Text",
                style:
                    TextStyle(color: Colors.tealAccent.shade400, fontSize: 18),
              ),
              const SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: "Note Text",
                  hintStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
