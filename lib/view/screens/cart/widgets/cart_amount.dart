import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/core/core.dart';

class CartAmountWidget extends StatelessWidget {
  const CartAmountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.27,
      width: size.width,
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.03,
        horizontal: size.height * 0.02,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(size.height * 0.02),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: kBodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Text(
                '\$400.00',
                style: kBodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tax',
                style: kBodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Text(
                '\$40.00',
                style: kBodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: kTitleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Text(
                '\$440.00',
                style: kTitleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding:
                        MaterialStatePropertyAll<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(
                                horizontal: size.height * 0.02)),
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(
                      kPrimaryColor,
                    ),
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          size.height * 0.03,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Order',
                    style: kBodyMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.03,),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding:
                        MaterialStatePropertyAll<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(
                                horizontal: size.height * 0.02)),
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(
                      kPrimaryColor,
                    ),
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          size.height * 0.03,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Order & Deliver',
                    style: kBodyMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
