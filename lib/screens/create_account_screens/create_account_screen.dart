import 'package:find_my_pet/controller/sign_up_controller.dart';
import 'package:find_my_pet/gen/colors.gen.dart';

import 'package:find_my_pet/screens/login_screen/login_screen.dart';
import 'package:find_my_pet/screens/login_screen/social_login_button/social_login_buttons.dart';
import 'package:find_my_pet/utils/app_form_fields_validator.dart';
import 'package:find_my_pet/utils/app_navigator.dart';
import 'package:find_my_pet/utils/text_style.dart';
import 'package:find_my_pet/widgets/app_text_field.dart';
import 'package:find_my_pet/widgets/sign_in_width.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../gen/assets.gen.dart';

class CreateAccountScreen extends StatelessWidget {
  final bool? isUpdatingProfile;
  const CreateAccountScreen({super.key, this.isUpdatingProfile});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final updatingAccount = (isUpdatingProfile ?? false);
    return Scaffold(
      body: GetBuilder<SignUpController>(
          init: SignUpController(),
          builder: (SignUpController controller) {
            return Form(
              key: controller.formKey,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: height * 0.05),
                        Text(
                          updatingAccount
                              ? "Update Profile"
                              : "Create an Account",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          updatingAccount
                              ? ""
                              : "Please enter the information\nbelow to create a new account.",
                          style: AppTextStyle.appMediumTextStyle(
                            color: ColorName.greyTextColor,
                            size: 16,
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        AppTextField(
                          hintText: "Email",
                          validator: AppFormFieldValidator.emailValidator,
                          controller: controller.emailTextFieldController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Assets.appIcons.emailIcon.svg(height: 10),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        AppTextField(
                          hintText: "First Name",
                          validator: (value) =>
                              AppFormFieldValidator.emptyFieldValidator(
                            value,
                            "Enter First Name",
                          ),
                          controller: controller.firstNameController,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        AppTextField(
                          hintText: "Last Name",
                          validator: (value) =>
                              AppFormFieldValidator.emptyFieldValidator(
                            value,
                            "Enter Last Name",
                          ),
                          controller: controller.lastNameController,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        AppTextField(
                          isPassword: true,
                          hintText: "Password",
                          validator: (value) =>
                              AppFormFieldValidator.passwordValidator(
                            value,
                          ),
                          controller: controller.passwordTextFieldController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Assets.appIcons.lockIcon.svg(height: 10),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        AppTextField(
                          validator: (value) =>
                              AppFormFieldValidator.passwordValidator(
                            value,
                          ),
                          controller:
                              controller.confirmPasswordTextFieldController,
                          isPassword: true,
                          hintText: "Confirm Password",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Assets.appIcons.lockIcon.svg(height: 10),
                          ),
                        ),
                        if (!updatingAccount) ...[
                          SizedBox(height: height * 0.05),
                          const SignInWithDivider(),
                          SizedBox(height: height * 0.03),
                          const SocialLoginButtons(),
                          SizedBox(height: height * 0.02),
                          Center(
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'Already have an Account? ',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: ColorName.greyTextColor,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Sign in',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => _openLoginScreen(context),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                        SizedBox(height: height * 0.03),
                        controller.isLoading
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : ElevatedButton(
                                onPressed: () =>
                                    controller.signUpWithEmailAndPassword(),
                                child: Text(
                                    updatingAccount ? "Update" : "Sign Up"),
                              ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _openLoginScreen(BuildContext context) {
    AppNavigator.removeAllPreviousAndPush(context, const LoginScreen());
  }
}
