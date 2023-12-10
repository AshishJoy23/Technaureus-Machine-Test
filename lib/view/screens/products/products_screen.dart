import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Products',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.width * 0.02),
          child: Column(
            children: [
              const SearchBarWidget(),
              SizedBox(
                height: size.height * 0.01,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.25,
                  mainAxisSpacing: size.width * 0.05,
                  crossAxisSpacing: size.width * 0.03,
                ),
                itemBuilder: (context, index) {
                  return const ProductCardWidget(
                    imageUrl:
                        "https://cdn.britannica.com/45/126445-050-4C0FA9F6/Kiwi-fruit.jpg",
                    productName: "Kiwiwwwwwwi",
                    productPrice: '100',
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

