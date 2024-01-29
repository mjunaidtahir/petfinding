import 'package:find_my_pet/screens/main_screen/main_screen.dart';
import 'package:find_my_pet/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

GetStorage box = GetStorage();

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailTextFieldController =
      TextEditingController(text: kDebugMode ? "junaid@mailinator.com" : "");
  final TextEditingController passwordTextFieldController =
      TextEditingController(text: kDebugMode ? "junaid" : "");
  final UserServices userServices = UserServices();
  bool isLoading = false;

  Future<void> signInWithEmailAndPassword() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    try {
      isLoading = true;
      update();
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextFieldController.text,
        password: passwordTextFieldController.text,
      );
      if (userCredential.user != null) {
        final user = await userServices.getUserFromId(userCredential.user!.uid);

        if (user != null) {
          box.write("user", true);
          Get.offAll(const MainScreen());
        }
      } else {}
    } catch (e) {
      if (e is FirebaseAuthException) {
        Fluttertoast.showToast(
            msg: e.message.toString(),
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
