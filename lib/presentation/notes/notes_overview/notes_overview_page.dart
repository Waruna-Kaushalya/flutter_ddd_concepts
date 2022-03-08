import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_concepts/application/auth/auth_bloc/bloc.dart';
import 'package:flutter_ddd_concepts/application/note/note_actor_bloc/note_actor_bloc.dart';
import 'package:flutter_ddd_concepts/application/note/note_watcher_bloc/note_watcher_bloc.dart';

import 'package:flutter_ddd_concepts/routes/app_router.dart';

import '../../../injection.dart';

class NotesOverviewPage extends StatelessWidget {
  static const routeName = '/notesoverviewpage';

  const NotesOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
          create: (context) => getIt<NoteWatcherBloc>()
            ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt<NoteActorBloc>(),
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unAuthenticated: (_) =>
                    context.router.replace(const SignInRoute()),
                orElse: () {},
              );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeMap(
                failure: (state) {
                  FlushbarHelper.createError(
                    duration: const Duration(seconds: 5),
                    message: state.noteFailure.map(
                      // Use localized strings here in your apps
                      insufficientPermissions: (_) =>
                          'Insufficient permissions ❌',
                      unableToUpdate: (_) => 'Impossible error',
                      unexpected: (_) =>
                          'Unexpected error occured while deleting, please contact support.',
                    ),
                  ).show(context);
                },
                orElse: () {},
              );
            },
          )
        ],
        child: Scaffold(
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
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
