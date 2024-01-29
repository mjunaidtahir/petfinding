import 'package:find_my_pet/gen/assets.gen.dart';
import 'package:find_my_pet/gen/colors.gen.dart';
import 'package:find_my_pet/utils/app_navigator.dart';
import 'package:find_my_pet/utils/text_style.dart';
import 'package:find_my_pet/widgets/app_bottom_sheet.dart';
import 'package:find_my_pet/widgets/app_text_field.dart';
import 'package:find_my_pet/widgets/build_drag_handler.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

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
              "Create New Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              "Your new password must be different from previous used passwords.",
              style: AppTextStyle.appMediumTextStyle(
                color: ColorName.greyTextColor,
                size: 16,
              ),
            ),
            SizedBox(height: height * 0.1),
            AppTextField(
              isPassword: true,
              hintText: "Password",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Assets.appIcons.lockIcon.svg(height: 10),
              ),
            ),
            SizedBox(height: height * 0.02),
            AppTextField(
              isPassword: true,
              hintText: "Confirm Password",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Assets.appIcons.lockIcon.svg(height: 10),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
        child: ElevatedButton(
            onPressed: () => _showPasswordResetSuccessfully(context),
            child: const Text("Submit")),
      ),
    );
  }

  Future<void>? _showPasswordResetSuccessfully(BuildContext context) {
    return AppBottomSheet.showBottomSheet(
      context: context,
      child: Column(
        children: [
          const BuildDragHandler(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Column(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Password Changed Successfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Your password has been changed successfully.",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.appMediumTextStyle(
                    color: ColorName.greyTextColor,
                    size: 16,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () => AppNavigator.pop(context),
                    child: const Text('Continue'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
