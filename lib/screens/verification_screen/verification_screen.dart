import 'package:find_my_pet/gen/assets.gen.dart';
import 'package:find_my_pet/gen/colors.gen.dart';
import 'package:find_my_pet/screens/home_screen/home_screen.dart';
import 'package:find_my_pet/utils/app_navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        height: 110,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () => openHomeScreen(context),
                child: const Text("Verify"),
              ),
              const SizedBox(height: 15),
              Center(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: 'Didn’t receive a code?',
                    style: const TextStyle(
                      fontSize: 16,
                      color: ColorName.greyTextColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Resend Code',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Assets.appIcons.lockIcon.svg(height: 125),
            ),
            SizedBox(height: height * 0.04),
            const Text(
              "Verification Code",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: height * 0.01),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: 'Please enter the 4-digit code\nwe sent to ',
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorName.greyTextColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'roman@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                ],
              ),
            ),
            SizedBox(height: height * 0.05),
            Pinput(
              focusedPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: const TextStyle(
                    fontSize: 20,
                    color: ColorName.primaryColor,
                    fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorName.primaryColor),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: const TextStyle(
                    fontSize: 20,
                    color: ColorName.greyTextColor,
                    fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorName.lightGrey),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              length: 4,
              errorTextStyle: const TextStyle(color: ColorName.primaryColor),
              validator: (s) {
                if (s == null || s.isEmpty || s.length < 4) {
                  return "Enter verification code to continue";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  void openHomeScreen(BuildContext context) {
    AppNavigator.removeAllPreviousAndPush(context, const HomeScreen());
  }
}
