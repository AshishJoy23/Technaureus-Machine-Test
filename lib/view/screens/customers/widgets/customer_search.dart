import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/view/screens/screens.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class CustomerSearchScreen extends StatelessWidget {
  CustomerSearchScreen({
    super.key,
  });

  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: SearchAppBarWidget(
        isCustomer: true,
        searchController: searchController,
      ),
      body: Obx(
        () => searchController.isCustomerSearching.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                  strokeWidth: 3.0,
                ),
              )
            : searchController.customersSuggestionList.isEmpty
                ? const SearchNotFoundWidget()
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                          vertical: size.width * 0.02),
                      child: Column(
                        children: [
                          ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: searchController.customersSuggestionList.length,
                        itemBuilder: (context, index) {
                          var customer =
                              searchController.customersSuggestionList[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.width * 0.02),
                            child: InkWell(
                              onTap: () {
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
    );
  }
}

