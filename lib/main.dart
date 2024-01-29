import 'package:find_my_pet/controller/login_controller.dart';
import 'package:find_my_pet/screens/login_screen/login_screen.dart';
import 'package:find_my_pet/screens/main_screen/main_screen.dart';
import 'package:find_my_pet/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const FindMyPet());
}

class FindMyPet extends StatelessWidget {
  const FindMyPet({super.key});

  @override
  Widget build(BuildContext context) {
    final user = box.read("user");
    return GetMaterialApp(
      theme: Themes().selectLightTheme(),
      home: user != null ? const MainScreen() : const LoginScreen(),
    );
  }
}
