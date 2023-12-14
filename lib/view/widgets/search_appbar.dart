import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class SearchAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isProduct;
  final bool isCustomer;
  final SearchController searchController;
  const SearchAppBarWidget({
    super.key,
    this.isProduct = false,
    this.isCustomer = false,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppBar(
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
          searchController.onClose();
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 24,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Search',
        style: kHeadlineSmall,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: size.width * 0.04),
          child: const Icon(
            FontAwesomeIcons.barsStaggered,
            color: Colors.black,
            size: 24,
          ),
        ),
      ],
      bottom: isProduct
          ? MainSearchBarWidget(isProduct: true)
          : isCustomer ? MainSearchBarWidget(isCustomer: true)
          : MainSearchBarWidget(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
