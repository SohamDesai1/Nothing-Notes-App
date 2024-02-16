import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../providers/theme.dart';
import '../providers/notes.dart';
import '../providers/pin_notes.dart';
import '../models/note.dart';
import '../widgets/note_display.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final titlectrl = TextEditingController();
  final textctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.read(noteDBProvider).fetchNotes();
    ref.read(pinNoteProvider).fetchPin();
  }

  void deleteNote(Note note) {
    ref.read(noteDBProvider).deleteNote(note.key);
  }

  void addPin(Note note) {
    ref.read(pinNoteProvider).addPin(note);
  }

  void removePin(Note note) {
    ref.read(pinNoteProvider).removePin(note);
  }

  Offset _tapPosition = Offset.zero;
  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  void _showContextMenu(BuildContext context, Note note) async {
    final RenderObject? overlay =
        Overlay.of(context).context.findRenderObject();

    await showMenu(
        context: context,
        position: RelativeRect.fromRect(
            Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
            Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                overlay.paintBounds.size.height)),
        items: [
          PopupMenuItem(
            value: 'Pin',
            child: Text(note.isPinned ? 'Unpin Note' : "Pin Note"),
            onTap: () {
              if (note.isPinned) {
                removePin(note);
              } else {
                addPin(note);
              }
            },
          ),
          PopupMenuItem(
              value: 'Delete',
              child: const Text('Delete'),
              onTap: () => deleteNote(note)),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themerProvider);
    final notesDB = ref.watch(noteDBProvider);
    final currNotes = notesDB.notes;
    log(currNotes.map((e) => e.title).toString());
    final pinNotes = ref.watch(pinNoteProvider);
    final pinned = pinNotes.pinnedNotes;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 10.h,
          title: Text("NOTES",
              style: TextStyle(
                fontSize: 7.h,
              )),
          actions: [
            theme.dark ? const Text("Dark Mode") : const Text("Light Mode"),
            SizedBox(
              width: 4.w,
            ),
            Switch(
                activeThumbImage: const AssetImage("assets/dark.png"),
                inactiveThumbImage: const AssetImage("assets/light.png"),
                value: theme.dark,
                onChanged: (bool value) {
                  theme.toggleTheme();
                })
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () => GoRouter.of(context).go('/new'),
          child: const Icon(
            Icons.add,
            color: Colors.red,
          ),
        ),
        body: currNotes.isEmpty
            ? const Center(
                child: Text(
                  "No notes available",
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    pinned.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Pinned",
                                style: TextStyle(fontSize: 22),
                              ),
                              SizedBox(
                                height: 30.h,
                                child: ListView.builder(
                                  itemCount: pinned.length,
                                  itemBuilder: (context, index) {
                                    final note = pinned[index];
                                    return GestureDetector(
                                      onTap: () {},
                                      onLongPress: () =>
                                          _showContextMenu(context, note),
                                      onTapDown: (details) =>
                                          _getTapPosition(details),
                                      child: NotesDisplay(
                                        title: note.title,
                                        content: note.text,
                                        color: theme.dark
                                            ? Colors.white
                                            : Colors.black,
                                        bgcolor: theme.dark
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: 80.h,
                      child: ListView.builder(
                        itemCount: (currNotes.length / 2).ceil(),
                        itemBuilder: (context, index) {
                          final startIndex = index * 2;
                          final endIndex = (index + 1) * 2;

                          final effectiveEndIndex = endIndex > currNotes.length
                              ? currNotes.length
                              : endIndex;
                          return Row(
                            children: List.generate(
                                effectiveEndIndex - startIndex, (i) {
                              final note = currNotes[startIndex + i];

                              return Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  onLongPress: () =>
                                      _showContextMenu(context, note),
                                  onTapDown: (details) =>
                                      _getTapPosition(details),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: NotesDisplay(
                                      title: note.title,
                                      content: note.text,
                                      color: theme.dark
                                          ? Colors.white
                                          : Colors.black,
                                      bgcolor: theme.dark
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ));
  }
}
