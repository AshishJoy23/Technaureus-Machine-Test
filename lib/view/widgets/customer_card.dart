import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/api_endpoints.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';

class CustomerCardWidget extends StatelessWidget {
  final CustomerModel customer;
  final CustomerController customerController;
  const CustomerCardWidget({
    super.key,
    required this.customer,
    required this.customerController,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(size.width * 0.03),
      child: Container(
        padding: EdgeInsets.all(size.width * 0.02),
        //width: size.width * 0.45,
        height: size.height * 0.145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width * 0.03),
        ),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.25,
              height: size.width * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(size.width * 0.03),
                child: customer.profilePic == null
                    ? Image.asset(
                        "assets/images/profile_pic_null.jpg",
                        width: size.width * 0.25,
                        height: size.width * 0.25,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        "$kImageBaseUrl${customer.profilePic}",
                        width: size.width * 0.25,
                        height: size.width * 0.25,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: Transform.scale(
                                scale: 0.5,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 3,
                                  backgroundColor: Colors.white,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }
                        },
                      ),
              ),
            ),
            SizedBox(
              height: size.width * 0.2,
              width: size.width * 0.05,
              child: const VerticalDivider(thickness: 1.0),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        customer.name,
                        style: kBodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(
                            CupertinoIcons.phone_circle_fill,
                            color: kPrimaryColor,
                          ),
                          Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.green,
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    'ID : ${customer.id}',
                    style: kBodyMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black45),
                  ),
                  Text(
                    '${customer.street}, ${customer.city}, ${customer.state}',
                    style: kBodyMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black45),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'Due Amount : ',
                        style: kBodyMedium!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        '\$${customer.id! + 500}',
                        style: kBodyMedium!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
