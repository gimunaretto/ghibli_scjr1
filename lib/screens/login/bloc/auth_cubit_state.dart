import 'package:equatable/equatable.dart';

class AuthCubitState extends Equatable {
  const AuthCubitState({
    required this.authLoading,
    required this.authAuthenticated,
    required this.errorMessage,
  });

  final bool authLoading;
  final bool authAuthenticated;
  final String errorMessage;

  AuthCubitState copyWith(
          {bool? authLoading, bool? authAuthenticated, String? errorMessage}) =>
      AuthCubitState(
        authAuthenticated: authAuthenticated ?? this.authAuthenticated,
        authLoading: authLoading ?? this.authLoading,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [DateTime.now()];
}
