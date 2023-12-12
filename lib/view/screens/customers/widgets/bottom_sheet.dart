import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/api_endpoints.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/customer_model.dart';
import 'package:technaureus_machine_test/view/screens/screens.dart';

class DetailsBottomSheetWidget extends StatelessWidget {
  final bool isEdit;
  final CustomerModel? customer;
  const DetailsBottomSheetWidget({
    super.key,
    this.isEdit = false,
    this.customer,
  });

  @override
  Widget build(BuildContext context) {
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
    var size = MediaQuery.of(context).size;
    if (isEdit) {
      nameController.text = customer!.name;
      mobileController.text = customer!.mobileNumber;
      emailController.text = customer!.email;
      streetController.text = customer!.street;
      street2Controller.text = customer!.streetTwo;
      cityController.text = customer!.city;
      pinController.text = customer!.pincode.toString();
      countryController.text = customer!.country;
      stateController.text = customer!.state;
    }
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isEdit ? 'Edit Customer' : 'Add Customer',
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
                profilePic: customer!.profilePic ??
                    "$kImageBaseUrl/media/customers/avatar_BiclVBz.jpg",
              );
              if (isEdit) {
                await customerController.editCustomer(
                    customer!.id!, updatedCustomer);
              } else {}
              Navigator.pop(context);
            },
            child: Text(
              'Submit',
              style: kBodyLarge!.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
