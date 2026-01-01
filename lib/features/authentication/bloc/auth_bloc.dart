import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promptix_ai_flutter/features/authentication/data/repositories/auth_repo.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  StreamSubscription? _authSub;

  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoginRequested>(_onLogin);
    on<RegisterRequested>(_onRegister);
    on<LogoutRequested>(_onLogout);

    // 🔒 Internal handlers
    on<InternalLoggedIn>(_onInternalLoggedIn);
    on<InternalLoggedOut>(_onInternalLoggedOut);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    _authSub = authRepo.authStateChanges.listen((user) {
      if (user != null) {
        add(InternalLoggedIn(user.uid));
      } else {
        add(InternalLoggedOut());
      }
    });
  }

  @override
  Future<void> close() {
    _authSub?.cancel();
    return super.close();
  }

  // Internal events (not from UI)
  void _onInternalLoggedIn(InternalLoggedIn event, Emitter<AuthState> emit) {
    emit(Authenticated(event.uid));
  }

  void _onInternalLoggedOut(InternalLoggedOut event, Emitter<AuthState> emit) {
    emit(Unauthenticated());
  }

  Future<void> _onLogin(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepo.login(event.email, event.password);
      debugPrint('authBloc => ${user?.email}');
      emit(Authenticated(user!.uid));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onRegister(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await authRepo.register(event.email, event.password);
      emit(Authenticated(user!.uid));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogout(LogoutRequested event, Emitter<AuthState> emit) async {
    await authRepo.logout();
    emit(Unauthenticated());
  }
}
