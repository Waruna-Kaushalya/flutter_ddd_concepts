import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_concepts/application/note/note_watcher_bloc/note_watcher_bloc.dart';

class NotesOverviewBody extends StatelessWidget {
  const NotesOverviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loading: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          success: (state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final note = state.notes[index];
                if (note.failureOption.isSome()) {
                  return Container();
                } else {
                  return Container();
                }
              },
            );
          },
          failure: (state) {
            return Container();
          },
        );
      },
    );
  }
}
