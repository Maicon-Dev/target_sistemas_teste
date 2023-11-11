import 'package:mobx/mobx.dart';

import '../../models/user_model.dart';
import '../../services/auth/auth_service.dart';
import '../../services/user/user_service.dart';

part 'signin_store.g.dart';

class SigninStore = SigninBase with _$SigninStore;

abstract class SigninBase with Store {
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  @observable
  UserModel? user;

  @observable
  String userName = '';

  @observable
  String password = '';

  @observable
  String userErrorMessageValidate = '';

  @observable
  String passwordErrorMessageValidate = '';

  @observable
  String authErrorMessageValidate = '';

  @action
  void setUserName(String value) {
    authErrorMessageValidate = '';
    userName = value;
    if (value.endsWith(' ')) {
      userErrorMessageValidate = 'O usuário não pode terminar com espaços';
    } else {
      userErrorMessageValidate = !userIsValid ? 'Usuário inválido!' : '';
    }
  }

  @action
  void setPassword(String value) {
    authErrorMessageValidate = '';
    password = value;
    if (value.endsWith(' ')) {
      passwordErrorMessageValidate = 'A senha não pode terminar com espaços ';
    } else {
      passwordErrorMessageValidate = !passwordIsValid ? 'Senha inválida!' : '';
    }
  }

  @computed
  bool get userIsValid {
    return userName.isNotEmpty && userName.length < 20;
  }

  @computed
  bool get passwordIsValid {
    final RegExp specialCharacteChecker = RegExp(r'^[a-z0-9]+$');
    return password.length > 2 &&
        password.length < 20 &&
        specialCharacteChecker.hasMatch(password);
  }

  @action
  Future<void> signin() async {
    try {
      userErrorMessageValidate = !userIsValid ? 'Usuário inválido!' : '';
      passwordErrorMessageValidate = !passwordIsValid ? 'Senha inválida!' : '';

      if (userIsValid && passwordIsValid) {
        final UserModel? userData =
            await _userService.getUserByUserName(userName);

        if (userData != null) {
          final response =
              await _authService.signInEmailPassword(userData.email, password);
          if (response != null) {
            user = userData;
          } else {
            authErrorMessageValidate =
                'Falha no login. Cheque os dados e teste novamente.';
          }
        } else {
          authErrorMessageValidate = 'Conta não existe.';
        }
      }
    } catch (e) {
      'Falha no login. Cheque os dados e teste novamente.';
    }
  }
}
