import 'package:flutter/material.dart';
import 'package:mob/screens/List/screen.dart';
import 'package:mob/stores/initializations.dart';
import 'package:mob/widgets/custom_text_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ReactionDisposer reactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Reaction observa um observable e executa uma função quando ele mudar
    // Não executa inicialmente como um (autorun semelhante ao useEffect do react)
    reactionDisposer = reaction(
      (_) => loginStore.isLogged,
      (isLogged) {
        if (loginStore.isLogged) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ListScreen()),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    reactionDisposer.reaction.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Container(
          height: 275,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextField(
                hintText: 'E-mail',
                prefix: const Icon(Icons.supervised_user_circle_sharp),
                onChanged: loginStore.setEmail,
              ),
              Observer(
                builder: (context) {
                  return CustomTextField(
                    hintText: 'Senha',
                    prefix: const Icon(Icons.lock),
                    onChanged: loginStore.setPassword,
                    obscureText: !loginStore.passwordVisible,
                    suffix: IconButton(
                      icon: Icon(
                        loginStore.passwordVisible
                            ? Icons.close_outlined
                            : Icons.remove_red_eye_sharp,
                      ),
                      onPressed: loginStore.togglePasswordVisibility,
                    ),
                  );
                },
              ),
              Observer(
                builder: (context) {
                  return Column(
                    children: [
                      FilledButton(
                        onPressed:
                            loginStore.isFormValid ? loginStore.login : null,
                        child: const Text('Login'),
                      ),
                      Text(loginStore.isLoading ? 'Carregando' : '')
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
