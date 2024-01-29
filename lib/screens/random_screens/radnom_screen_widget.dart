import 'package:find_my_pet/screens/pet_details_screen.dart/pet_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RandomScreenWidget extends StatelessWidget {
  final String? screen;
  const RandomScreenWidget({super.key, this.screen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          screen ?? "",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(100, (index) {
                return Card(
                  child: ListTile(
                    onTap: () => Get.to(
                      const PetDetailsScreen(),
                    ),
                    leading: Image.network(
                      "https://thumbs.dreamstime.com/b/pet-icon-vector-sign-symbol-isolated-white-background-logo-concept-your-web-mobile-app-design-134155170.jpg",
                      height: 30,
                    ),
                    title: const Text(
                      "Pet name",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
