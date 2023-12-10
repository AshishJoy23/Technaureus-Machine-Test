import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/view/core/core.dart';

class SearchBarWidget extends StatelessWidget {
  final bool isCustomer;
  const SearchBarWidget({
    super.key,
    this.isCustomer = false,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05,
      child: TextFormField(
        cursorColor: Colors.black,
        style: kBodyMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),
        textAlignVertical: TextAlignVertical.bottom,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black38,
            ),
            hintText: 'Search',
            hintStyle: kBodyMedium!.copyWith(
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 10.0,
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.qr_code,
                  color: Colors.black38,
                ),
                isCustomer
                    ? Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.add_circle,
                              color: kPrimaryColor,
                              size: 28,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          SizedBox(
                            height: size.height * 0.03,
                            child: const VerticalDivider(thickness: 1.0),
                          ),
                          Text(
                            'Fruits',
                            style: kBodyMedium!.copyWith(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 16,
                            color: Colors.black38,
                          )
                        ],
                      ),
                SizedBox(
                  width: size.width * 0.03,
                ),
              ],
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular((size.height * 0.05) / 2),
              gapPadding: 0.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular((size.height * 0.05) / 2),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            )),
      ),
    );
  }
}
