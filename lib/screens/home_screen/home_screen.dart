import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:find_my_pet/gen/assets.gen.dart';
import 'package:find_my_pet/gen/colors.gen.dart';
import 'package:find_my_pet/screens/add_pet_details/add_pet_details_screen.dart';
import 'package:find_my_pet/screens/emergency_locator/emergency_locator.dart';
import 'package:find_my_pet/screens/login_screen/login_screen.dart';
import 'package:find_my_pet/screens/pet_details_screen.dart/pet_details_screen.dart';
import 'package:find_my_pet/screens/random_screens/radnom_screen_widget.dart';
import 'package:find_my_pet/utils/app_navigator.dart';
import 'package:find_my_pet/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTextAnimated = false;
  @override
  void initState() {
    isTextAnimated = true;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: const [Icon(Icons.notification_important)],
        title: Row(
          children: [
            Image.network(
              "https://free-icon.org/material/04-illustration/0390-download-image-m.png",
              // Adjust the height as needed
              height: 30,
            ),
            const SizedBox(width: 10),
            Text(isTextAnimated ? "" : "Find My Pet"),
            AnimatedTextKit(
              totalRepeatCount: 2,
              animatedTexts: [
                RotateAnimatedText('Find My Pet'),
              ],
              onFinished: () {
                isTextAnimated = false;
                setState(
                  () {},
                );
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              color: ColorName.primaryColor,
              height: height * 0.3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          child: Assets.appIcons.google.svg(),
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Junaid Tahir",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "user@mail.com",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.report),
              title: Text("Lost and Finding Reports"),
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text("Pets Information"),
            ),
            const ListTile(
              leading: Icon(Icons.backup),
              title: Text("Backup and Sync"),
            ),
            ListTile(
              onTap: () {
                _openEmergencyLocatorScreen();
              },
              leading: const Icon(Icons.map_rounded),
              title: const Text("Veterinary and Emergency Locator"),
            ),
            const ListTile(
              leading: Icon(Icons.help),
              title: Text("Help and Support"),
            ),
            ListTile(
              leading: Assets.appIcons.logout.svg(),
              title: const Text("Logout"),
              onTap: () => AppNavigator.removeAllPreviousAndPush(
                  context, const LoginScreen()),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Column(
            children: [
              const AppTextField(
                hintText: "Search",
                suffixIcon: Icon(Icons.search),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 180,
                width: double.infinity,
                child: Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmY5CWV9Gy2lOYVZnDOjKooGRO7TwQRPLHPsFHfbt4g9g9cCabxgEmt36ppZN5CHfEElE&usqp=CAU",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Image.network(
                          "https://purepng.com/public/uploads/large/purepng.com-dog-lookinganimalsdog-981524671625rfjb4.png",
                          height: 100,
                        ),
                      ),
                      const Positioned(
                        left: 10,
                        top: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "We Can  Help",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                            Text(
                              "to find your pet",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            const EmergencyLocatorScreen(),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Row(
                              children: [
                                Icon(Icons.info),
                                SizedBox(width: 10),
                                Text("Find lost Pet"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _openMissingPet();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Row(
                              children: [
                                Icon(Icons.report),
                                SizedBox(width: 10),
                                Text("Report Missing"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            "https://cdn.pixabay.com/photo/2021/01/05/22/01/paw-5892565_1280.png",
                            height: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "My Pets",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () => Get.to(
                            const RandomScreenWidget(screen: "My Pets"),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // Button background color
                            onPrimary: Colors.black, // Text color
                            side: const BorderSide(
                                color: Colors.black,
                                width: 1.5), // Border style
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "https://free-icon.org/material/04-illustration/0390-download-image-m.png",
                                // Adjust the height as needed
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                  width: 8.0), // Spacer between image and text
                              const Text('My Pets',
                                  style: TextStyle(fontSize: 18.0)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(const RandomScreenWidget(
                  screen: "Reports",
                )),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                            "https://static.vecteezy.com/system/resources/previews/024/163/885/non_2x/pets-black-and-white-illustration-vector.jpg"),
                        const SizedBox(width: 10),
                        const Text(
                          "Reports",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.emergency),
                              Text(
                                "Pet Tips",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "View More",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(4, (index) {
                        return SizedBox(
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () => Get.to(const PetDetailsScreen()),
                                leading: Image.network(
                                  "https://free-icon.org/material/04-illustration/0390-download-image-m.png",
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration:
                                          BoxDecoration(border: Border.all()),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          "Pet Name",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10)
                                  ],
                                ),
                                subtitle: const Text(
                                  "Foods Dog should not eat",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              const Divider()
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.emergency),
                          Text(
                            "Pet Lost & found",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text("Reports",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 10),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(10, (index) {
                        return SizedBox(
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () => Get.to(const PetDetailsScreen()),
                                leading: Image.network(
                                  "https://free-icon.org/material/04-illustration/0390-download-image-m.png",
                                ),
                                title: const Text(
                                  "Pet Name",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: const Text(
                                  "I lost my registered pet",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                trailing: const Icon(
                                    Icons.arrow_forward_ios_outlined),
                              ),
                              const Divider()
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "FAQ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 28.0, right: 10, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Bio Matric For Pets",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "Pets",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: Image.network(
                                    "https://purepng.com/public/uploads/large/purepng.com-dog-lookinganimalsdog-981524671625rfjb4.png",
                                    height: 100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _openMissingPet() {
    Get.to(const AddPetDetails());
  }

  void _openEmergencyLocatorScreen() {
    Get.to(const EmergencyLocatorScreen());
  }
}
