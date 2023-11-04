import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/Component/constant.dart';

import 'package:hedspi_learningapp/Note/note_data.dart';

class EditScreen extends StatefulWidget {
  final Note? note;
  const EditScreen({super.key, this.note});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.note != null) {
      _titleController = TextEditingController(text: widget.note!.title);
      _contentController = TextEditingController(text: widget.note!.content);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Note"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body:
            //padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            Container(
          color: kPrimaryColor,
          child: Column(children: [
            Expanded(
                child: Center(
              child: Container(
                //padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                decoration: const BoxDecoration(
                    color: kOtherColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kDefaultPadding * 2),
                        topRight: Radius.circular(kDefaultPadding * 2))),
                child: SizedBox(
                  //width: MediaQuery.of(context).size.width / 1.1,
                  //height: MediaQuery.of(context).size.height,
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    children: [
                      TextField(
                        controller: _titleController,
                        style: const TextStyle(
                            color: kTextBlackColor, fontSize: 30),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Title',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 30)),
                      ),
                      sizedBox,
                      TextField(
                        controller: _contentController,
                        style: const TextStyle(
                          color: kTextBlackColor,
                        ),
                        maxLines: null,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type something here',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(
                context, [_titleController.text, _contentController.text]);
          },
          elevation: 10,
          backgroundColor: kSecondaryColor,
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
