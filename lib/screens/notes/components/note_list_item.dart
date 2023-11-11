import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:target_sistemas_teste/stores/note/note_store.dart';

import '../../../assets/icons/target_sistemas_teste_icons.dart';
import '../../../models/note_model.dart';

class NoteListItem extends StatelessWidget {
  final Note note;
  const NoteListItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final noteStore = Provider.of<NoteStore>(context);

    return Container(
      height: 60,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 3, color: Color(0x33333333)),
        ),
      ),
      child: Row(
        children: [
          const Spacer(),
          Text(
            note.content.length > 18
                ? '${note.content.substring(0, 18)}...'
                : note.content,
            style: const TextStyle(
              color: Color(0xFF000000),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              // noteStore.editNote(note);
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Editar nota'),
                  content: TextFormField(
                    initialValue: note.content,
                    decoration: const InputDecoration(
                      labelText: 'Nota',
                    ),
                    onChanged: noteStore.setNote,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        noteStore.editNote(note);
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('Salvar'),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(0),
              height: 39,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFF333333),
                    width: 1,
                  ),
                ),
              ),
              child: const Icon(
                TargetSistemasTesteIcons.edit,
                size: 40,
              ),
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Deseja apagar a nota?'),
                  content: Text(note.content),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        noteStore.deleteNote(note.id!);
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('Apagar'),
                    ),
                  ],
                ),
              );
            },
            child: const Icon(
              Icons.cancel,
              color: Color(0xFFC8352F),
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}
