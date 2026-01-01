abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  LoginRequested(this.email, this.password);
}

class RegisterRequested extends AuthEvent {
  final String email;
  final String password;
  RegisterRequested(this.email, this.password);
}
class AppStarted extends AuthEvent {}

class LogoutRequested extends AuthEvent {}
///INTERNAL EVENTS (not triggered from UI)
class InternalLoggedIn extends AuthEvent {
  final String uid;
  InternalLoggedIn(this.uid);
}

class InternalLoggedOut extends AuthEvent {}