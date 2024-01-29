import 'package:find_my_pet/controller/social_login_controller.dart';
import 'package:find_my_pet/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialLoginController>(
        init: SocialLoginController(),
        builder: (SocialLoginController controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : _SocialLoginButton(
                  icon: Assets.appIcons.google.svg(),
                  onPressed: () {
                    controller.signInWithGoogle();
                  },
                );
        });
  }
}

class _SocialLoginButton extends StatelessWidget {
  const _SocialLoginButton({
    required this.icon,
    this.onPressed,
  });

  final void Function()? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 10),
              const Text("Google"),
            ],
          ),
        ));
  }
}
