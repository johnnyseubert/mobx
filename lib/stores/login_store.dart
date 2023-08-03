import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _Login with _$LoginStore;

abstract class _Login with Store {
  _Login() {
    // Sempre que um observable mudar e que ele estiver sendo chamado dentro
    // do autorun ele vai executar o auto run
    // Nesse caso ele só vai printar quando o password mudar o email nao está
    // Sendo usado dentro do auto run se eu adicionar o email ai ele tbm vai
    // printar quando o email mudar
    autorun((_) {
      debugPrint('Nova Senha autorun: $password');
    });
  }

  //////////////////////////////////
  ///////////OBSERVABLES////////////
  //////////////////////////////////

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool passwordVisible = false;

  @observable
  bool isLoading = false;

  @observable
  bool isLogged = false;

  //////////////////////////////////
  //////////////ACTIONS/////////////
  //////////////////////////////////

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  void logout() => isLogged = false;

  @action
  Future<void> login() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
    isLogged = true;
  }

  //////////////////////////////////
  ////////////COMPUTEDS/////////////
  //////////////////////////////////

  // Computed é um valor que é calculado a partir de outros @observable
  @computed
  bool get isFormValid => isPasswordValid && isEmailValid;

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isEmailValid => email.length >= 6;
}
