import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../models/note_model.dart';
import 'note_list_item.dart';

class NoteList extends StatelessWidget {
  final List<Note>? notes;
  const NoteList({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(8, 50),
          bottomLeft: Radius.elliptical(8, 50),
          topRight: Radius.elliptical(8, 50),
          bottomRight: Radius.elliptical(8, 50),
        ),
      ),
      child: ListView.builder(
        itemCount: notes?.length,
        controller: controller,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        itemBuilder: (context, index) {
          return Observer(
            builder: (context) {
              return NoteListItem(note: notes![index]);
            }
          );
        },
      ),
    );
  }
}
