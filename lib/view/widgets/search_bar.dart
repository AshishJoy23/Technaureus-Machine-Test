import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';

class MainSearchBarWidget extends StatelessWidget implements PreferredSizeWidget{
  final bool isCustomer;
  final bool isProduct;
   MainSearchBarWidget({
    super.key,
    this.isCustomer = false,
    this.isProduct = false,
  });

  final _debouncer = Debouncer(milliseconds: 1000);
  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
      child: SizedBox(
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
          onChanged: (value) {
            _debouncer.run(() { 
              if (isProduct) {
                searchController.getSearchedProducts(value);
              } else {
                searchController.getSearchedCustomers(value);
              }
            });
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
              suffixIcon: isProduct
                  ? Row(
                    mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.qr_code,
                          color: Colors.black38,
                        ),
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
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                      ],
                    )
                  : Row(
                    mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.qr_code,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        isCustomer
                            ? const Icon(
                                Icons.add_circle,
                                color: kPrimaryColor,
                                size: 28,
                              )
                            : const SizedBox(),
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
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(40);
}
