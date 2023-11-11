// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SigninStore on SigninBase, Store {
  Computed<bool>? _$userIsValidComputed;

  @override
  bool get userIsValid =>
      (_$userIsValidComputed ??= Computed<bool>(() => super.userIsValid,
              name: 'SigninBase.userIsValid'))
          .value;
  Computed<bool>? _$passwordIsValidComputed;

  @override
  bool get passwordIsValid =>
      (_$passwordIsValidComputed ??= Computed<bool>(() => super.passwordIsValid,
              name: 'SigninBase.passwordIsValid'))
          .value;

  late final _$userAtom = Atom(name: 'SigninBase.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$userNameAtom =
      Atom(name: 'SigninBase.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'SigninBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$userErrorMessageValidateAtom =
      Atom(name: 'SigninBase.userErrorMessageValidate', context: context);

  @override
  String get userErrorMessageValidate {
    _$userErrorMessageValidateAtom.reportRead();
    return super.userErrorMessageValidate;
  }

  @override
  set userErrorMessageValidate(String value) {
    _$userErrorMessageValidateAtom
        .reportWrite(value, super.userErrorMessageValidate, () {
      super.userErrorMessageValidate = value;
    });
  }

  late final _$passwordErrorMessageValidateAtom =
      Atom(name: 'SigninBase.passwordErrorMessageValidate', context: context);

  @override
  String get passwordErrorMessageValidate {
    _$passwordErrorMessageValidateAtom.reportRead();
    return super.passwordErrorMessageValidate;
  }

  @override
  set passwordErrorMessageValidate(String value) {
    _$passwordErrorMessageValidateAtom
        .reportWrite(value, super.passwordErrorMessageValidate, () {
      super.passwordErrorMessageValidate = value;
    });
  }

  late final _$authErrorMessageValidateAtom =
      Atom(name: 'SigninBase.authErrorMessageValidate', context: context);

  @override
  String get authErrorMessageValidate {
    _$authErrorMessageValidateAtom.reportRead();
    return super.authErrorMessageValidate;
  }

  @override
  set authErrorMessageValidate(String value) {
    _$authErrorMessageValidateAtom
        .reportWrite(value, super.authErrorMessageValidate, () {
      super.authErrorMessageValidate = value;
    });
  }

  late final _$signinAsyncAction =
      AsyncAction('SigninBase.signin', context: context);

  @override
  Future<void> signin() {
    return _$signinAsyncAction.run(() => super.signin());
  }

  late final _$SigninBaseActionController =
      ActionController(name: 'SigninBase', context: context);

  @override
  void setUserName(String value) {
    final _$actionInfo = _$SigninBaseActionController.startAction(
        name: 'SigninBase.setUserName');
    try {
      return super.setUserName(value);
    } finally {
      _$SigninBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$SigninBaseActionController.startAction(
        name: 'SigninBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$SigninBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
userName: ${userName},
password: ${password},
userErrorMessageValidate: ${userErrorMessageValidate},
passwordErrorMessageValidate: ${passwordErrorMessageValidate},
authErrorMessageValidate: ${authErrorMessageValidate},
userIsValid: ${userIsValid},
passwordIsValid: ${passwordIsValid}
    ''';
  }
}
