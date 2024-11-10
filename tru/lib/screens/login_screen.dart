import 'package:flutter/material.dart';
import 'package:tru/widgets/assets/btn.dart';
import '../assets/app_colors.dart';
import '../widgets/assets/txt_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Padding(
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
              ),
              TxtRoundedFill(
                hintText: 'Enter Your Company',
                txtBoxLabel: 'Company',
                txtBoxWidth: 266,
                txtBoxFontSize: 18,
                txtBoxBorderRadius: 25,
                isPassword: false,
              ),
              TxtRoundedFill(
                hintText: 'Enter Your UserID',
                txtBoxLabel: 'UserID',
                txtBoxWidth: 266,
                txtBoxFontSize: 18,
                txtBoxBorderRadius: 25,
                isPassword: false,
              ),
              TxtRoundedFill(
                hintText: 'Enter Your Password',
                txtBoxLabel: 'Password',
                txtBoxWidth: 266,
                txtBoxFontSize: 18,
                txtBoxBorderRadius: 25,
                isPassword: true,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50, top: 50),
                child: BtnPrimary(
                  btnText: "login",
                  txtBoxFontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.background,
    );
  }
}
