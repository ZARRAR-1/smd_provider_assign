import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'catalog_screen.dart';

void main() {
  // runApp(const MyApp());
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CartModel()),
        ],
        child: const MyApp(),
      ),
    );
  }


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Provide-Shopping Cart',

      home: MyCatalog(),
    );
  }
}
