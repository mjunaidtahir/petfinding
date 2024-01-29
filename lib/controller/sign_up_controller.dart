import 'package:find_my_pet/model/user.dart';
import 'package:find_my_pet/screens/login_screen/login_screen.dart';
import 'package:find_my_pet/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final UserServices _userServices = UserServices();

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailTextFieldController =
      TextEditingController();
  bool isLoading = false;

  final TextEditingController passwordTextFieldController =
      TextEditingController();
  final TextEditingController confirmPasswordTextFieldController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  Future<void> signUpWithEmailAndPassword() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    try {
      isLoading = true;
      update();
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextFieldController.text,
        password: passwordTextFieldController.text,
      );

      final User? currentUser = userCredential.user;

      if (currentUser != null) {
        final user = await _userServices.signUpUser(
          id: currentUser.uid,
          email: currentUser.email,
          name: firstNameController.text,
          provider: AuthType.email,
        );

        Get.offAll(const LoginScreen());
      } else {
        Fluttertoast.showToast(
            msg: "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } finally {
      isLoading = false;
      update();
    }
  }
}
