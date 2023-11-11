import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:target_sistemas_teste/screens/notes/notes_page.dart';
import 'package:target_sistemas_teste/stores/signin/signin_store.dart';
import 'package:url_launcher/url_launcher.dart';

import '../signin/signin_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final signinStore = Provider.of<SigninStore>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Expanded(
            child: Observer(builder: (context) {
              if (signinStore.user == null) {
                return const SigninPage();
              } else {
                return const NotesPage();
              }
            }),
          ),
          GestureDetector(
            child: const Text(
              'Política de Privacidade',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFABF7F4),
              ),
            ),
            onTap: () {
              launchUrl(Uri.parse('https://google.com'));
            },
          )
        ],
      ),
    );
  }
}
