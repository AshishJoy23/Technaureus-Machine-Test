import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/controller/cart_controller.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/view/screens/screens.dart';


class MyAppScreen extends StatefulWidget {
  const MyAppScreen({super.key});

  @override
  State<MyAppScreen> createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  List screens = [];
  int selectedIndex = 0;
  final CartController controller = Get.put(CartController());

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const DummyScreen(),
      const CartScreen(),
      const DummyScreen(),
      const DummyScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          elevation: 10.0,
          backgroundColor: kSecondaryColor,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kPrimaryColor,
          selectedFontSize: 10,
          unselectedFontSize: 8,
          iconSize: 28,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          items: [
            const BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
              ),
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.post_add,
              ),
              label: 'New Order',
            ),
            BottomNavigationBarItem(
              activeIcon: Stack(
                children: [
                  const Center(
                    child: Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                  Positioned(
                    right: 35,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: kPrimaryColor,
                      child: Text(
                        '9',
                        style: kBodySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              icon: Center(
                child: Stack(
                  children: [
                    const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: kPrimaryColor,
                        child: Text(
                          '9',
                          style: kBodySmall!.copyWith(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.subdirectory_arrow_left,
              ),
              label: 'Return Order',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.groups_outlined,
              ),
              label: 'Customers',
            ),
          ]),
    );
  }
}
