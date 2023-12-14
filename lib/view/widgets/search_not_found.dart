import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/core/core.dart';

class SearchNotFoundWidget extends StatelessWidget {
  const SearchNotFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/search_not_found.png',
              width: size.width * 0.6,
              height: size.height * 0.25,
              fit: BoxFit.contain,
            ),
            Text(
              'Search Not Found!!',
              style: kTitleMedium,
            ),
            const Spacer()
          ],
        ),
      );
  }
}
