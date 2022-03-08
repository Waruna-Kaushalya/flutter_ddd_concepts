import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_concepts/application/auth/auth_bloc/bloc.dart';

class NotesOverviewPage extends StatelessWidget {
  static const routeName = '/notesoverviewpage';

  const NotesOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            context.read<AuthBloc>().add(const AuthEvent.signOut());
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.indeterminate_check_box),
          ),
        ],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to note form page
        },
      ),
    );
  }
}
