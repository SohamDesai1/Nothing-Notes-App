import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer';
import 'package:sizer/sizer.dart';
import '../providers/notes.dart';
import '../routes/routes.dart';

class NewNote extends ConsumerStatefulWidget {
  const NewNote({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewNoteState();
}

class _NewNoteState extends ConsumerState<NewNote> {
  final titlectrl = TextEditingController();
  final textctrl = TextEditingController();

  void createNote() {
    ref.read(noteDBProvider).addNote(titlectrl.text, textctrl.text);
    log("CurrNotes:${ref.read(noteDBProvider).notes.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("New Note"),
          leading: IconButton(
              onPressed: () => Routes.router.go("/"),
              icon: const Icon(
                Icons.arrow_back,
              ))),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 20, 20, 20),
                      borderRadius: BorderRadius.circular(20)),
                  height: 82.h,
                  width: 42.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 2.h),
                        child: TextField(
                          controller: titlectrl,
                          decoration: InputDecoration(
                              hintText: "Title",
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 4.h),
                              border: InputBorder.none),
                          cursorColor: Colors.white,
                        ),
                      ),
                      // SizedBox(
                      //   height: 0.1.h,
                      // ),
                      Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: SizedBox(
                            height: 72.h,
                            child: TextField(
                              controller: textctrl,
                              minLines: 1,
                              maxLines: null,
                              style: TextStyle(fontSize: 2.1.h),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Note",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 2.h),
                              ),
                              cursorColor: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                ElevatedButton(
                    onPressed: () => createNote(), child: const Text("Create"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
