import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/AppData.dart';
import 'package:hedspi_learningapp/Component/constant.dart';
import 'package:hedspi_learningapp/Firebase/FirebaseFunc.dart';
import 'package:hedspi_learningapp/Screen/Note/editNoteScreen.dart';
import 'package:hedspi_learningapp/Screen/Note/note_data.dart';
import 'package:intl/intl.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  static String routeName = "/notescreeen";

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List<Note> filterNotes = [];
  bool sorted = false;
  @override
  void initState() {
    super.initState();
    filterNotes = noteList;
  }

  List<Note> sortNotesByModifiedTime(List<Note> notes) {
    if (sorted) {
      notes.sort((a, b) => a.modifiedTime.compareTo(b.modifiedTime));
    } else {
      notes.sort((b, a) => a.modifiedTime.compareTo(b.modifiedTime));
    }

    sorted = !sorted;

    return notes;
  }

  Color getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  void onSearchTextChanged(String searchText) {
    setState(() {
      filterNotes = noteList
          .where((note) =>
              (note.title.toLowerCase().contains(searchText.toLowerCase())) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void deleteNote(int index) {
    setState(() {
      Note note = filterNotes[index];
      deleteNoteFromFirebaseByNoteId(note.id);
      noteList.remove(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Note'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    filterNotes = sortNotesByModifiedTime(filterNotes);
                  });
                },
                icon: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(kDefaultPadding / 2)),
                  child: const Icon(Icons.sort, color: kTextWhiteColor),
                ),
              )
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      child: TextFormField(
                          onChanged: onSearchTextChanged,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: kTextWhiteColor),
                          decoration: InputDecoration(
                            floatingLabelStyle:
                                const TextStyle(color: kTextWhiteColor),
                            //labelStyle: const TextStyle(color: kTextWhiteColor),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 12),
                            hintText: 'Search notes ...',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: kTextWhiteColor.withOpacity(0.4),
                                    fontWeight: FontWeight.w400),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: kTextWhiteColor,
                            ),
                            fillColor: kOtherColor.withOpacity(0.5),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.circular(kDefaultPadding),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.circular(kDefaultPadding),
                            ),
                          )),
                    ),
                  ),
                  sizedBox,
                  sizedBox,
                  Expanded(
                      child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    //padding: const EdgeInsets.all(kDefaultPadding / 2),
                    itemCount: filterNotes.length,
                    itemBuilder: (context, int index) {
                      return Card(
                          margin: const EdgeInsets.only(
                              bottom: kDefaultPadding / 1.7),
                          color: getRandomColor(),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(kDefaultPadding / 2)),
                          child: ListTile(
                            onTap: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EditScreen(note: filterNotes[index]),
                                ),
                              );
                              if (result != null) {
                                setState(() {
                                  int originalIndex =
                                      noteList.indexOf(filterNotes[index]);

                                  noteList[originalIndex] = Note(
                                      id: noteList[originalIndex].id,
                                      title: result[0],
                                      content: result[1],
                                      modifiedTime: DateTime.now());

                                  filterNotes[index] = Note(
                                      id: filterNotes[index].id,
                                      title: result[0],
                                      content: result[1],
                                      modifiedTime: DateTime.now());
                                });
                              }
                            },
                            title: RichText(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: '${filterNotes[index].title} \n',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: kTextBlackColor),
                                  children: [
                                    TextSpan(
                                        text: filterNotes[index].content,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: kTextBlackColor))
                                  ]),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(
                                  top: kDefaultPadding / 2),
                              child: Text(
                                'Edited: ${DateFormat('EEE MMM d, yyyy h:mm a').format(filterNotes[index].modifiedTime)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: kTextLightColor),
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                final result = await popupCheckDelete(context);
                                if (result != null && result) {
                                  deleteNote(index);
                                }
                              },
                            ),
                          ));
                    },
                  ))
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const EditScreen(),
                ),
              );

              if (result != null) {
                setState(() {
                  String temp = DateTime.now().toIso8601String();
                  addUserNote(temp, temp, result[0], result[1], Student.uid);
                  noteList.add(Note(
                      id: temp,
                      title: result[0],
                      content: result[1],
                      modifiedTime: DateTime.now()));
                  filterNotes = noteList;
                });
              }
            },
            backgroundColor: kSecondaryColor.withOpacity(0.9),
            child: const Icon(Icons.add),
          )),
    );
  }

  Future<dynamic> popupCheckDelete(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kSecondaryColor.withOpacity(0.5),
            icon: const Icon(
              Icons.info,
              color: Colors.grey,
            ),
            title: const Text(
              'Are you sure that you want to delete this note?',
              style: TextStyle(color: Colors.white),
            ),
            content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const SizedBox(
                        width: 60,
                        child: Text(
                          'No',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const SizedBox(
                        width: 60,
                        child: Text(
                          'Yes',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ]),
          );
        });
  }
}
