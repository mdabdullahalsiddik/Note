import 'package:flutter/material.dart';
import 'package:notepad/models/note_model.dart';

import 'homa_page.dart';

// ignore: must_be_immutable
class NoteTextPage extends StatefulWidget {
  NoteTextPage({super.key, required this.titleList});
  List<NoteModel>? titleList;

  @override
  State<NoteTextPage> createState() => _NoteTextPageState();
}

class _NoteTextPageState extends State<NoteTextPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();

  List<NoteModel> list = [];

  String? date;

  @override
  void initState() {
    list = widget.titleList ?? [];
    super.initState();
  }

  addData() {
    list.add(NoteModel(
      noteTitle: titleController.text,
      noteText: textController.text,
      dateTime: DateTime.now().toString().substring(0, 16),
    ));
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
          if (titleController.text.isEmpty && textController.text.isEmpty) {
          } else {
            addData();

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(itemList: list),
                ));
          }
        },
        child: const Text(
          "save",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 5),
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
              const SizedBox(height: 10),
              TextField(
                maxLines: 25,
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
