import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tru/screens/login/bloc/user_auth_bloc.dart';
import 'package:tru/screens/po_approval.dart';
import 'package:tru/widgets/assets/btn.dart';
import '../../../assets/app_colors.dart';
import '../../../widgets/assets/txt_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserAuthBloc _userAuthBloc = UserAuthBloc();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _passCode = TextEditingController();
  final TextEditingController _domain = TextEditingController();
  final TextEditingController _company = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _userAuthBloc.add(IsLogin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAuthBloc, UserAuthState>(
      listener: (context, state) {
        if (state is NavAuthScreenToPOApprovelState ||
            state is AuthSucessState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PoApprovel()),
          );
        }
      },
      buildWhen: (previous, current) => current is! UserAuthState,
      listenWhen: (previous, current) => current is UserAuthState,
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
                      Icons.supervised_user_circle,
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
                    textEditingController: _domain,
                  ),
                  TxtRoundedFill(
                    hintText: 'Enter Your Company',
                    txtBoxLabel: 'Company',
                    txtBoxWidth: 266,
                    txtBoxFontSize: 18,
                    txtBoxBorderRadius: 25,
                    isPassword: false,
                    textEditingController: _company,
                  ),
                  TxtRoundedFill(
                    hintText: 'Enter Your UserID',
                    txtBoxLabel: 'UserID',
                    txtBoxWidth: 266,
                    txtBoxFontSize: 18,
                    txtBoxBorderRadius: 25,
                    isPassword: false,
                    textEditingController: _userName,
                  ),
                  TxtRoundedFill(
                    hintText: 'Enter Your Password',
                    txtBoxLabel: 'Password',
                    txtBoxWidth: 266,
                    txtBoxFontSize: 18,
                    txtBoxBorderRadius: 25,
                    isPassword: true,
                    textEditingController: _passCode,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50, top: 50),
                    child: BtnPrimary(
                      btnText: "login",
                      txtBoxFontSize: 18,
                      callback: () {
                        context.read<UserAuthBloc>().add(AfterLoginButtonClick(
                            domainURL:
                                'https://erp-application.jwllogic.com/e11Pilot2100/TokenResource.svc/',
                            compnay: 'JWL',
                            password: _passCode.text,
                            username: _userName.text));
                      },
                    ),
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
}
