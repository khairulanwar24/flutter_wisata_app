import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wisata_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_wisata_app/presentation/home/main_page.dart';

import '../../core/core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          SizedBox(
            height: 260.0,
            child: Center(
              child: Assets.images.logoWhite.image(height: 55.0),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20.0)),
                child: ColoredBox(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 44.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: emailController,
                          label: 'Email',
                          isOutlineBorder: false,
                        ),
                        const SpaceHeight(36.0),
                        CustomTextField(
                          controller: passwordController,
                          label: 'Password',
                          isOutlineBorder: false,
                          obscureText: true,
                        ),
                        const SpaceHeight(86.0),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            state.maybeWhen(
                                orElse: () {},
                                success: (data) {
                                  context.pushReplacement(const MainPage());
                                });
                            return Button.filled(
                              onPressed: () {
                                context.read<LoginBloc>().add(
                                      LoginEvent.login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                // context.pushReplacement(const MainPage());
                              },
                              label: 'Login',
                            );
                          },
                        ),
                        const SpaceHeight(128.0),
                        Center(
                          child: Assets.images.logoCwb.image(height: 40.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
