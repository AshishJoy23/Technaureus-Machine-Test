import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/view/screens/screens.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class ProductSearchScreen extends StatelessWidget {
  ProductSearchScreen({
    super.key,
  });

  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: SearchAppBarWidget(
        isProduct: true,
        searchController: searchController,
      ),
      body: Obx(
        () => searchController.isProductSearching.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                  strokeWidth: 3.0,
                ),
              )
            : searchController.productsSuggestionList.isEmpty
                ? const SearchNotFoundWidget()
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                          vertical: size.width * 0.02),
                      child: Column(
                        children: [
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                searchController.productsSuggestionList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.25,
                              mainAxisSpacing: size.width * 0.05,
                              crossAxisSpacing: size.width * 0.03,
                            ),
                            itemBuilder: (context, index) {
                              var product = searchController
                                  .productsSuggestionList[index];
                              return ProductCardWidget(
                                product: product,
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

