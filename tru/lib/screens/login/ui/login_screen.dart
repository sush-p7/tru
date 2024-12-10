import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tru/screens/login/bloc/user_auth_bloc.dart';
import 'package:tru/screens/home/ui/po_approval.dart';
import 'package:tru/widgets/assets/btn.dart';
import '../../../assets/app_colors.dart';
import '../../../widgets/assets/txt_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _domainController = TextEditingController();
  final _companyEnvironmentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(CheckAuthStatus());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        print("BlocConsumer listener - Current state: ${state.status}");
        print("Error message: ${state.errorMessage}");
        if (state.status == AuthStatus.authenticated) {
          print("Authentication successful - navigating to PoApprovel");

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PoApprovel()),
          );
        }

        if (state.status == AuthStatus.error && state.errorMessage != null) {
          print("Showing error snackbar: ${state.errorMessage}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Icon(
                      Ionicons.person,
                      color: AppColors.primaryText,
                      size: 100,
                    ),
                  ),
                  TxtRoundedFill(
                    hintText: 'Enter Your URL',
                    txtBoxLabel: 'URL',
                    txtBoxWidth: 266,
                    txtBoxFontSize: 18,
                    txtBoxBorderRadius: 25,
                    isPassword: false,
                    textEditingController: _domainController,
                  ),
                  TxtRoundedFill(
                    hintText: 'Enter Your Environment',
                    txtBoxLabel: 'Environment',
                    txtBoxWidth: 266,
                    txtBoxFontSize: 18,
                    txtBoxBorderRadius: 25,
                    isPassword: false,
                    textEditingController: _companyEnvironmentController,
                  ),
                  TxtRoundedFill(
                    hintText: 'Enter Your UserID',
                    txtBoxLabel: 'UserID',
                    txtBoxWidth: 266,
                    txtBoxFontSize: 18,
                    txtBoxBorderRadius: 25,
                    isPassword: false,
                    textEditingController: _usernameController,
                  ),
                  TxtRoundedFill(
                    hintText: 'Enter Your Password',
                    txtBoxLabel: 'Password',
                    txtBoxWidth: 266,
                    txtBoxFontSize: 18,
                    txtBoxBorderRadius: 25,
                    isPassword: true,
                    textEditingController: _passwordController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50, top: 50),
                    child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                      print(
                          "BlocConsumer builder - Current state: ${state.status}");
                      return BtnPrimary(
                        btnText: state.isLoading ? "Loading..." : "Login",
                        txtBoxFontSize: 18,
                        callback: state.isLoading
                            ? null
                            : () {
                                // if (_formKey.currentState?.validate() ??
                                //     false) {
                                context.read<AuthBloc>().add(
                                      LoginRequested(
                                        username: _usernameController.text,
                                        password: _passwordController.text,
                                        URL: _domainController.text,
                                        ENV: _companyEnvironmentController.text,
                                      ),
                                    );
                                // }
                                print("Button pressed"); // Debug print
                                _handleLoginPressed();
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  _handleLoginPressed();
                                }
                              },
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
          backgroundColor: AppColors.background,
        );
      },
    );
  }

  void _handleLoginPressed() {
    print("Login button pressed"); // Debug print

    // Basic validation
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username and password are required')),
      );
      print("Login event dispatched");
      return;
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _domainController.dispose();
    _companyEnvironmentController.dispose();
    super.dispose();
  }
}
