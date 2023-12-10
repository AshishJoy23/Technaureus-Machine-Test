import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/view/core/core.dart';

class ProductCardWidget extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productPrice;
  const ProductCardWidget({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(size.width * 0.05),
      child: Container(
        padding: EdgeInsets.all(size.width * 0.015),
        width: size.width * 0.45,
        height: size.height * 0.1,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(size.width * 0.05),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: size.width * 0.3,
              height: size.width * 0.18,
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
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        overflow: TextOverflow.ellipsis,
                        style: kBodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$$productPrice/-',
                        style: kBodySmall!.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                  child: const VerticalDivider(
                    thickness: 0.5,
                    color: Colors.black38,
                  ),
                ),
                Container(
                  width: size.width * 0.13,
                  height: size.height * 0.03,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    // child: index == 0
                    //     ? Row(
                    //         mainAxisAlignment:
                    //             MainAxisAlignment.spaceEvenly,
                    //         children: [
                    //           InkWell(
                    //             onTap: () => log('message-----'),
                    //             child: const Icon(
                    //               Icons.remove,
                    //               color: kSecondaryColor,
                    //               size: 12,
                    //             ),
                    //           ),
                    //           Text(
                    //             '10',
                    //             style: kBodySmall!.copyWith(
                    //               color: kSecondaryColor,
                    //             ),
                    //           ),
                    //           InkWell(
                    //             onTap: () => log('message'),
                    //             child: const Icon(
                    //               Icons.add,
                    //               color: kSecondaryColor,
                    //               size: 12,
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Add',
                          style: kBodySmall!.copyWith(
                            color: kSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
