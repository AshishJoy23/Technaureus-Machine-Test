import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technaureus_machine_test/view/core/core.dart';
import 'package:technaureus_machine_test/view/screens/new_order/return_order_screen.dart';
import 'package:technaureus_machine_test/view/screens/screens.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> iconDataList = [
      Icons.groups,
      CupertinoIcons.cube_box,
      Icons.post_add,
      Icons.subdirectory_arrow_left,
      FontAwesomeIcons.coins,
      CupertinoIcons.square_favorites_fill,
      Icons.receipt_long,
      Icons.route,
    ];
    List<String> cardTitleList = [
      'Customers',
      'Products',
      'New Order',
      'Return Order',
      'Add Payment',
      "Today's Order",
      "Today's Summery",
      'Route',
    ];
    List<Widget> cardRouteList = [
      const CustomersScreen(),
      const ProductsScreen(),
      const NewOrderScreen(),
      const ReturnOrderScreen(),
      const MyAppScreen(),
      const MyAppScreen(),
      const MyAppScreen(),
      const MyAppScreen(),
    ];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        title: '',
        isHome: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04, vertical: size.width * 0.02),
                itemCount: iconDataList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.25,
                  mainAxisSpacing: size.width * 0.05,
                  crossAxisSpacing: size.width * 0.03,
                ),
                itemBuilder: (context, index) {
                  return HomeGridCardWidget(
                    cardIcon: iconDataList[index],
                    cardTitle: cardTitleList[index],
                    index: index,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => cardRouteList[index],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
