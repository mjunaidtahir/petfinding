import 'package:find_my_pet/controller/login_controller.dart';
import 'package:find_my_pet/gen/assets.gen.dart';
import 'package:find_my_pet/gen/colors.gen.dart';
import 'package:find_my_pet/screens/create_account_screens/create_account_screen.dart';
import 'package:find_my_pet/screens/login_screen/social_login_button/social_login_buttons.dart';
import 'package:find_my_pet/screens/reset_password_screen/reset_password_screen.dart';
import 'package:find_my_pet/utils/app_form_fields_validator.dart';
import 'package:find_my_pet/utils/app_navigator.dart';
import 'package:find_my_pet/utils/text_style.dart';
import 'package:find_my_pet/widgets/app_text_field.dart';
import 'package:find_my_pet/widgets/sign_in_width.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: SingleChildScrollView(
            child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (LoginController controller) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(
                        child: Text(
                          "Find My Pet",
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      const Text(
                        "Login to your Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        "Please enter the information\nbelow to login.",
                        style: AppTextStyle.appMediumTextStyle(
                          color: ColorName.greyTextColor,
                          size: 16,
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      AppTextField(
                        controller: controller.emailTextFieldController,
                        hintText: "Email",
                        validator: AppFormFieldValidator.emailValidator,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Assets.appIcons.emailIcon.svg(height: 10),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      AppTextField(
                        validator: (value) =>
                            AppFormFieldValidator.passwordValidator(
                          value,
                        ),
                        controller: controller.passwordTextFieldController,
                        isPassword: true,
                        hintText: "Password",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Assets.appIcons.lockIcon.svg(height: 10),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      Center(
                        child: GestureDetector(
                          onTap: () => _openResetPasswordScreen(context),
                          child: Text(
                            "Forget Password?",
                            style: AppTextStyle.appMediumTextStyle(
                              color: Colors.black,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      controller.isLoading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive())
                          : ElevatedButton(
                              onPressed: () =>
                                  controller.signInWithEmailAndPassword(),
                              child: const Text("Login"),
                            ),
                      SizedBox(height: height * 0.03),
                      const SignInWithDivider(),
                      SizedBox(height: height * 0.03),
                      const SocialLoginButtons(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 30,
          alignment: Alignment.center,
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              text: 'Don’t have an Account? ',
              style: const TextStyle(
                fontSize: 16,
                color: ColorName.greyTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'Sign up',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _openSignUpScreen(context);
                      }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openSignUpScreen(BuildContext context) {
    AppNavigator.push(context, const CreateAccountScreen());
  }

  void _openResetPasswordScreen(BuildContext context) {
    AppNavigator.push(context, const ResetPasswordScreen());
  }
}
