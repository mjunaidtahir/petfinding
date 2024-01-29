import 'package:find_my_pet/gen/assets.gen.dart';
import 'package:find_my_pet/gen/colors.gen.dart';
import 'package:find_my_pet/screens/verification_screen/verification_screen.dart';
import 'package:find_my_pet/utils/app_navigator.dart';
import 'package:find_my_pet/utils/text_style.dart';
import 'package:find_my_pet/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Reset Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              "Please enter the information below to reset your account password.",
              style: AppTextStyle.appMediumTextStyle(
                color: ColorName.greyTextColor,
                size: 16,
              ),
            ),
            SizedBox(height: height * 0.1),
            AppTextField(
              hintText: "Email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Assets.appIcons.emailIcon.svg(height: 10),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
        child: ElevatedButton(
            onPressed: () => _openVerificationScreen(context),
            child: const Text("Submit")),
      ),
    );
  }

  void _openVerificationScreen(BuildContext context) {
    AppNavigator.push(context, const VerificationScreen());
  }
}
