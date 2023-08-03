# Explicações

### Packages necessários

-  Comando para gerar os códigos

-  `flutter pub run build_runner watch --delete-conflicting-outputs`

```yaml
dependencies:
   flutter_mobx:
   mobx:

dev_dependencies:
   build_runner:
   mobx_codegen:
```

---

### Estrutura de arquivo

```dart
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _Login with _$LoginStore;

abstract class _Login with Store {

   _Login() {
      autorun((_) {
         print('Nova Senha autorun: $password');
      });

      reaction((_) => email, (String email) {
         print('Nova Senha reaction: $email');
      });
   }

   @observable
   String email = '';

   @action
   void setEmail(String value) => email = value;

   @computed
   bool get isEmailValid => email.contains('@');
}
```

---

### Observable

-  Um observable nada mais é do que uma variavel que pode ser observada, ou seja, que pode ser alterada e que quando alterada, notifica os widgets que estão observando essa variavel e rebuilda aquela parte.

```dart
@observable
String name = 'Gabriel';
```

---

### Action

-  Uma action é uma função que altera o valor de uma variavel observavel, ou seja, é uma função que altera o valor de uma variavel e notifica os widgets que estão observando essa variavel e rebuilda aquela parte.

```dart
@action
void changeName(String newName) {
  name = newName;
}
```

---

### Observer

-  Um observer é um widget que observa uma variavel observavel, ou seja, é um widget que quando a variavel observavel é alterada, ele rebuilda aquela parte.

```dart
Observer(
  builder: (_) => Text(controller.name),
),
```

---

### Computed

-  Um computed é uma variavel que é computada a partir de uma ou mais variaveis observaveis, ou seja, é uma variavel que quando uma ou mais variaveis observaveis são alteradas, ela é alterada e notifica os widgets que estão observando essa variavel e rebuilda aquela parte.

```dart
@computed
String get nameUpperCase => name.toUpperCase();
```

---

### Autorun

-  Um autorun é uma função que é executada sempre que uma variavel observavel é alterada, ou seja, é uma função que quando uma variavel observavel é alterada, ela é executada e notifica os widgets que estão observando essa variavel e rebuilda aquela parte.

-  Ela sempre dispara quando é carregado e quando é alterado. Igual ao useEffect do React.

```dart
autorun((_) {
  print(controller.name);
});
```

---

### Reaction

-  Um reaction é uma função que é executada sempre que uma variavel observavel é alterada, ou seja, é uma função que quando uma variavel observavel é alterada, ela é executada e notifica os widgets que estão observando essa variavel e rebuilda aquela parte.

-  Ela só dispara quando é alterado não quando inicia.

```dart
reaction((_) => controller.name, (String name) {
  print(name);
});
```

---

### ObservableList

-  Um observableList nada mais é do que uma lista que pode ser observada, ou seja, que pode ser alterada e que quando alterada, notifica os widgets que estão observando essa lista e rebuilda aquela parte.

```dart
ObservableList<T> list = ObservableList<T>();
```

---
