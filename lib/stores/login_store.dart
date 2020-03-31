import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  
  @observable
  String email = "";
  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";
  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = false;
  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool loading = false;
  @observable
  bool loggedIn = false;

  @computed
  bool get isEmailValid => RegExp(r"[A-Za-z0-9\\._-]+@[A-Za-z0-9]+(\\.[A-Za-z]+)*").hasMatch(email);

  @computed
  bool get isPasswordValid => password.length > 6;

  @computed
  Function get loginPressed => 
    (isEmailValid && isPasswordValid && !loading) ? login : null;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 3));

    loading = false;
    loggedIn = true;
  }

  @action
  void logout(){
    setEmail("");
    setPassword("");
    loggedIn = false;
  }

}