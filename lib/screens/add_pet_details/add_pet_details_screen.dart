import 'dart:io';

import 'package:find_my_pet/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class AddPetDetails extends StatelessWidget {
  final List<String>? images;
  const AddPetDetails({super.key, this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    (images?.isEmpty ?? true)
                        ? "Report Missing Pet"
                        : "Pet Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
                  ),
                ),
                if (images?.isNotEmpty ?? false)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(images!.length, (index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: 100,
                            width: 110,
                            child: Image.file(
                              File(images![index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      })
                    ],
                  )
                else
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                              height: 100,
                              width: 110,
                              child: Image.network(
                                  "https://img.freepik.com/premium-vector/cat-pets-black-stand-alone-flat-modern-minimal-mascot-logo-icon-vector-illustration_15473-18140.jpg?w=2000")),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                              height: 100,
                              width: 110,
                              child: Image.network(
                                  "https://img.freepik.com/premium-vector/cat-pets-black-stand-alone-flat-modern-minimal-mascot-logo-icon-vector-illustration_15473-18140.jpg?w=2000")),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                              height: 100,
                              width: 110,
                              child: Image.network(
                                  "https://img.freepik.com/premium-vector/cat-pets-black-stand-alone-flat-modern-minimal-mascot-logo-icon-vector-illustration_15473-18140.jpg?w=2000")),
                        ),
                      ]),
                const SizedBox(height: 20),
                const Text("Please Add Your Pet Details Below"),
                const SizedBox(height: 15),
                const AppTextField(hintText: "Owner Name"),
                const SizedBox(height: 5),
                const AppTextField(hintText: "Pet Type"),
                const SizedBox(height: 5),
                const AppTextField(hintText: "Sex"),
                const SizedBox(height: 5),
                const AppTextField(hintText: "Color"),
                const SizedBox(height: 5),
                const AppTextField(hintText: "International Name"),
                const SizedBox(height: 5),
                const AppTextField(hintText: "Address Details"),
                const SizedBox(height: 5),
                const AppTextField(hintText: "Description"),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add Pet Details"),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
