import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technaureus_machine_test/view/core/core.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Customers',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.width * 0.02),
          child: Column(
            children: [
              const SearchBarWidget(
                isCustomer: true,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: size.width * 0.02),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: size.height * 0.5,
                              padding: EdgeInsets.all(size.width * 0.04),
                              decoration: BoxDecoration(
                                  color: kSecondaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(size.width * 0.1),
                                    topRight: Radius.circular(size.width * 0.1),
                                  )),
                              child: Center(
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  //mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          (size.width * 0.1) /
                                                              2)),
                                              child: const Icon(Icons.clear)),
                                        )
                                      ],
                                    ),
                                    Text('Customer Name',style: kBodyLarge!.copyWith(
                                              color: Colors.black38,
                                              fontWeight: FontWeight.bold,
                                            ),textHeightBehavior: TextHeightBehavior(applyHeightToLastDescent: false),),
                                    SizedBox(
                                      height: size.height * 0.04,
                                      child: TextFormField(
                                        cursorColor: Colors.black,
                                        style: kBodyMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        onTapOutside: (event) {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                              horizontal: 10.0,
                                            ),
                                            border: const UnderlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      (size.height * 0.01)),
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                              ),
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(size.width * 0.03),
                        child: Container(
                          padding: EdgeInsets.all(size.width * 0.02),
                          //width: size.width * 0.45,
                          height: size.height * 0.13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.03),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.25,
                                height: size.width * 0.25,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.03),
                                  child: Image.network(
                                    "https://as1.ftcdn.net/v2/jpg/02/43/12/34/1000_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                                    width: size.width * 0.25,
                                    height: size.width * 0.25,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return Center(
                                          child: Transform.scale(
                                            scale: 0.5,
                                            child:
                                                const CircularProgressIndicator(
                                              strokeWidth: 3,
                                              backgroundColor: Colors.white,
                                              color: Colors.black,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.width * 0.2,
                                width: size.width * 0.05,
                                child: const VerticalDivider(thickness: 1.0),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Customer Name',
                                          style: kBodyLarge!.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Icon(
                                              CupertinoIcons.phone_circle_fill,
                                              color: kPrimaryColor,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.whatsapp,
                                              color: Colors.green,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Text(
                                      'ID : 1213243',
                                      style: kBodyMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45),
                                    ),
                                    Text(
                                      'West Palazhi, Calicut, Kerala',
                                      style: kBodyMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          'Due Amount : ',
                                          style: kBodyMedium!.copyWith(
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          '\$500',
                                          style: kBodyMedium!.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
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
