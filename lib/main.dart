import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:technaureus_machine_test/blocs/cart/cart_bloc.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/cart/cart_model.dart';
import 'package:technaureus_machine_test/model/product/product_model.dart';
import 'package:technaureus_machine_test/services/hive_db_services.dart';
import 'package:technaureus_machine_test/view/screens/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<CartModel>('cart');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(cartServices: HiveServices())
        ..add(const AllCustomersCartCreated())
        ..add(const AllCustomersCartLoaded()),
      child: GetMaterialApp(
        title: 'Technaureus Machine Test',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: MyAppScreen(),
      ),
    );
  }
}
