import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../components/custom_input_field.dart';
import '../../stores/note/note_store.dart';
import 'components/note_list.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final noteStore = Provider.of<NoteStore>(context);
    final TextEditingController textFieldController = TextEditingController();

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: noteStore.fetchNotes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return Observer(builder: (context) {
                    return NoteList(notes: noteStore.noteList);
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            Observer(builder: (context) {
              return CustomInputField(
                autofocos: true,
                hintText: 'Digite seu texto',
                controller: textFieldController,
                onSubmitted: (value) {
                  noteStore.createNote();
                  textFieldController.clear();
                },
                onChanged: (value) => {
                  noteStore.setNote(value),
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
