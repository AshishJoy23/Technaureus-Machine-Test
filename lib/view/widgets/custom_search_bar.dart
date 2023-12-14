import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';
import 'package:technaureus_machine_test/view/screens/screens.dart';

class CustomSearchBarWidget extends StatelessWidget {
  final bool isCustomer;
  final bool isProduct;
  CustomSearchBarWidget({
    super.key,
    this.isCustomer = false,
    this.isProduct = false,
  });

  final CustomerController customerController = Get.put(CustomerController());
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController street2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => isProduct
          ? Get.to(ProductSearchScreen())
          : Get.to(CustomerSearchScreen()),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        height: size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((size.height * 0.05) / 2),
          border: Border.all(
            color: Colors.black38,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.black38,
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Text(
                  'Search',
                  style: kBodyMedium!.copyWith(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            isProduct
                ? Row(
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
                      )
                    ],
                  )
                : Row(
                    children: [
                      const Icon(
                        Icons.qr_code,
                        color: Colors.black38,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      isCustomer
                          ? InkWell(
                              onTap: () {
                                addCustomerBottomSheet(context);
                              },
                              child: const Icon(
                                Icons.add_circle,
                                color: kPrimaryColor,
                                size: 28,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> addCustomerBottomSheet(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.02,
          ),
          decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.width * 0.1),
                topRight: Radius.circular(size.width * 0.1),
              )),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Customer',
                      style: kTitleLarge,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          height: size.width * 0.08,
                          width: size.width * 0.08,
                          decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.circular((size.width * 0.1) / 2)),
                          child: const Icon(Icons.clear)),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomTextFormField(
                  labelText: 'Customer Name',
                  textController: nameController,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomTextFormField(
                  labelText: 'Mobile Number',
                  isNum: true,
                  textController: mobileController,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomTextFormField(
                  labelText: 'Email',
                  textController: emailController,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'Address',
                      style: kTitleMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'Street',
                        textController: streetController,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'Street 2',
                        textController: street2Controller,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'City',
                        textController: cityController,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'Pin Code',
                        isNum: true,
                        textController: pinController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'Country',
                        textController: countryController,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'State',
                        textController: stateController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: size.height * 0.05)),
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                      kPrimaryColor,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          size.height * 0.03,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    CustomerModel updatedCustomer = CustomerModel(
                      name: nameController.text.trim(),
                      mobileNumber: mobileController.text.trim(),
                      email: emailController.text.trim(),
                      street: streetController.text.trim(),
                      streetTwo: street2Controller.text.trim(),
                      city: cityController.text.trim(),
                      pincode: int.parse(pinController.text.trim()),
                      country: countryController.text.trim(),
                      state: stateController.text.trim(),
                    );
                    customerController.addNewCustomer(updatedCustomer);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Submit',
                    style: kBodyLarge!.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
