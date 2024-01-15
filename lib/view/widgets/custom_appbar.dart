import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/core/core.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isHome;
  final double heightFactor;
  const CustomAppBar({
    super.key,
    required this.title,
    this.isHome = false,
    this.heightFactor = 50,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppBar(
      leading: isHome
          ? Padding(
              padding: EdgeInsets.only(left: size.width * 0.04),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_pic.png'),
              ),
            )
          : InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 24,
                color: Colors.black,
              ),
            ),
      centerTitle: true,
      title: Text(
        title,
        style: kHeadlineSmall,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: size.width * 0.04),
          child: const Icon(
            FontAwesomeIcons.barsStaggered,
            color: Colors.black,
            size: 24,
          ),
        ),
      ],
    );
  }



  @override
  Size get preferredSize => Size.fromHeight(heightFactor);
}
