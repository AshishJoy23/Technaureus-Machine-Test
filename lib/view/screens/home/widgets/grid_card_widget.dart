import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/view/core/core.dart';

class HomeGridCardWidget extends StatelessWidget {
  final String cardTitle;
  final IconData cardIcon;
  final int index;
  final VoidCallback onTap;
  const HomeGridCardWidget({
    super.key,
    required this.cardTitle,
    required this.cardIcon,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(size.width * 0.05),
        child: Container(
          padding: EdgeInsets.all(size.width * 0.02),
          width: size.width * 0.45,
          height: size.height * 0.1,
          decoration: BoxDecoration(
            color: index == 1 ? kPrimaryColor : kSecondaryColor,
            borderRadius: BorderRadius.circular(size.width * 0.05),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                cardIcon,
                size: 40,
                color: index == 1 ? kSecondaryColor : kPrimaryColor,
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Text(
                cardTitle,
                style: kTitleMedium!.copyWith(
                  color: index == 1 ? kSecondaryColor : Colors.black,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
