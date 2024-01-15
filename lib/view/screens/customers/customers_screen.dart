import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';
import 'package:technaureus_machine_test/view/screens/screens.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class CustomersScreen extends StatelessWidget {
  CustomersScreen({super.key});

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'Customers',
      ),
      body: Obx(
        () => customerController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                  strokeWidth: 3.0,
                ),
              )
            : customerController.customersList.isEmpty
                ? const Center(
                  child: CustomAnimation(
                    animationUrl: 'assets/animation/no_data.json',
                    message: 'Data Not Found!!!',
                  ),
                )
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                          vertical: size.width * 0.02),
                      child: Column(
                        children: [
                          CustomSearchBarWidget(
                            isCustomer: true,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: customerController.customersList.length,
                            itemBuilder: (context, index) {
                              var customer =
                                  customerController.customersList[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.width * 0.02),
                                child: InkWell(
                                  onTap: () {
                                    nameController.text = customer.name;
                                    mobileController.text =
                                        customer.mobileNumber;
                                    emailController.text = customer.email;
                                    streetController.text = customer.street;
                                    street2Controller.text = customer.streetTwo;
                                    cityController.text = customer.city;
                                    pinController.text =
                                        customer.pincode.toString();
                                    countryController.text = customer.country;
                                    stateController.text = customer.state;
                                    editCustomerBottomSheet(context, customer);
                                  },
                                  child: CustomerCardWidget(
                                    customer: customer,
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
      ),
      bottomSheet: const CustomBottomNavWidget(),
    );
  }

  Future<dynamic> editCustomerBottomSheet(
      BuildContext context, CustomerModel customer) {
    var size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(size.width * 0.1),
      )),
      backgroundColor: kSecondaryColor,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.02,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Edit Customer',
                      style: kTitleLarge,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          height: size.width * 0.08,
                          width: size.width * 0.08,
                          decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(
                                  (size.width * 0.1) / 2)),
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
                      profilePic: customer.profilePic,
                      mobileNumber: mobileController.text.trim(),
                      email: emailController.text.trim(),
                      street: streetController.text.trim(),
                      streetTwo: street2Controller.text.trim(),
                      city: cityController.text.trim(),
                      pincode: int.parse(pinController.text.trim()),
                      country: countryController.text.trim(),
                      state: stateController.text.trim(),
                    );
                    customerController.editCustomer(
                        customer.id!, updatedCustomer);
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
