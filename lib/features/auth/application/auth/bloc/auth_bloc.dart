import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  AuthBloc(
    this._authFacade,
  ) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        authCheckRequested: (value) async {
          final userOption = await _authFacade.getSignedInUser();
          emit(
            userOption.fold(
              () => const AuthState.unAuthenticated(),
              (_) => const AuthState.authenticated(),
            ),
          );
        },
        signOut: (value) async {
          await _authFacade.signOut();
          emit(const AuthState.unAuthenticated());
        },
      );
    });
  }
}
