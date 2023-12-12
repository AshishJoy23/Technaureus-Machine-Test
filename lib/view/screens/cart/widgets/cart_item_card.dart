import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/core/core.dart';

class CartItemCardWidget extends StatelessWidget {
  final int index;
  final String itemName;
  final int itemPrice;
  final bool isLast;
  const CartItemCardWidget({
    super.key,
    required this.index,
    required this.itemName,
    required this.itemPrice,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.09,
      width: size.width,
      child: Column(
        children: [
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$itemName | 550g',
                      style: kBodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$$itemPrice',
                      style: kBodyMedium!.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.19,
                    height: size.height * 0.035,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => log('message-----'),
                          child: const Icon(
                            Icons.remove,
                            color: kSecondaryColor,
                            size: 14,
                          ),
                        ),
                        Text(
                          '10',
                          style: kBodyMedium!.copyWith(
                            color: kSecondaryColor,
                          ),
                        ),
                        InkWell(
                          onTap: () => log('message'),
                          child: const Icon(
                            Icons.add,
                            color: kSecondaryColor,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  InkWell(
                    onTap: () => log('message-----'),
                    child: const Icon(
                      CupertinoIcons.delete_solid,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          isLast
              ? const SizedBox(
                  height: 1.0,
                )
              : const Divider(
                  thickness: 1.0,
                ),
        ],
      ),
    );
  }
}
