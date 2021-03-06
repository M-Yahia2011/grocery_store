import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:grocery_store/screens/item_details_screen.dart';
import 'package:grocery_store/screens/orders_screen.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../providers/cart_provider.dart';
import '../helpers/app_theme.dart';
import '../screens/tab_screen.dart';
import '../screens/all_products_screen.dart';
import '../screens/categories_table_screen.dart';
import '../screens/category_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.amber, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Grocery Store",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: TabScreen(),
        routes: {
          CategoryScreen.routeName: (ctx) => CategoryScreen(),
          CategoriesTableScreen.routeName: (ctx) => CategoriesTableScreen(),
          AllProductsScreen.routeName: (ctx) => AllProductsScreen(),
          OrdersScreen.routeName:(ctx)=> OrdersScreen(),
          ItemDetailsScreen.routeName:(ctx)=>ItemDetailsScreen(),
        },
      ),
    );
  }
}
