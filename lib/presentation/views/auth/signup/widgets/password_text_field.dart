part of '../signup_view.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            onChanged: (password) =>
                context.read<SignupBloc>().add(SignupPasswordChanged(password)),
            obscureText: true,
            decoration: InputDecoration(
              labelText: AppStrings.password,
              errorText: (state.password.status == FormzInputStatus.valid ||
                      state.password.status == FormzInputStatus.pure)
                  ? null
                  : AppStrings.passwordErrorSimple,
            ),
          ),
        );
      },
    );
  }
}
