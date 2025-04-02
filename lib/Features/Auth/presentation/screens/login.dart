import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendex_app/Features/Auth/presentation/widgets/forget_password_and_signup_section.dart';
import '../../../../core/utils/strings.dart';
import '../widgets/email_field.dart';
import '../widgets/login_button.dart';
import '../widgets/password_field.dart';
import '../cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => LoginCubit(),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(state.message,style: TextStyle(color: Colors.white),)));
              Navigator.pushReplacementNamed(context, Strings.ordersScreen);
            } else if (state is LoginError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: Form(
            key: formKey,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.0.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 150.h),
                    Text(
                      'Welcome Back!',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 80.h),
                    EmailField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.h),
                    PasswordField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 50.h),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return LoginButton(
                          onPressed: () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            final email = emailController.text;
                            final password = passwordController.text;
                            context.read<LoginCubit>().login(email, password);
                          },
                          isLoading: state is LoginLoading,
                        );
                      },
                    ),
                    ForgetPasswordAndSignupSection()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
