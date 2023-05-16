class RegisterCubitState {
  RegisterCubitState(
      {required this.registerLoading,
      required this.createdRegister,
      required this.errorMessage});

  final bool registerLoading;
  final bool createdRegister;
  final String errorMessage;

  RegisterCubitState copyWith(
          {bool? registerLoading,
          bool? createdRegister,
          String? errorMessage}) =>
      RegisterCubitState(
        createdRegister: createdRegister ?? this.createdRegister,
        registerLoading: registerLoading ?? this.registerLoading,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
