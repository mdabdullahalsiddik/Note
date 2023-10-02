// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoteModel {
  String? noteTitle;
  String? noteText;
  String? dateTime;
 
  NoteModel({
    this.noteTitle,
    this.noteText,
    required this.dateTime,
  });
}
