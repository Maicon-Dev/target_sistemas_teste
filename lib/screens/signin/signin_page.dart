import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../components/custom_input_field.dart';
import '../../stores/signin/signin_store.dart';
import 'components/signin_button.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signinStore = Provider.of<SigninStore>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Observer(builder: (context) {
          return CustomInputField.user(
            onChanged: signinStore.setUserName,
            errorText: signinStore.userErrorMessageValidate,
          );
        }),
        const SizedBox(height: 20),
        Observer(builder: (context) {
          return CustomInputField.password(
            onChanged: signinStore.setPassword,
            errorText: signinStore.passwordErrorMessageValidate,
          );
        }),
        Observer(builder: (context) {
          return signinStore.authErrorMessageValidate.isNotEmpty
              ? Column(
                  children: [
                    const SizedBox(height: 0),
                    Text(
                      signinStore.authErrorMessageValidate,
                      style: const TextStyle(color: Color(0xFFF71302)),
                    ),
                    const SizedBox(height: 25),
                  ],
                )
              : const SizedBox(height: 40);
        }),
        SizedBox(
          width: 190,
          height: 50,
          child: SigninButton(
            onPressed: signinStore.signin,
          ),
        ),
      ],
    );
  }
}
