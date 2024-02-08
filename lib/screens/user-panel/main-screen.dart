
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_e_comm/utils/app-constant.dart';
import 'package:get/get.dart';

import '../../widgets/all-products-widget.dart';
import '../../widgets/banner-widget.dart';
import '../../widgets/category-widget.dart';
import '../../widgets/custom-drawer-widget.dart';
import '../../widgets/flash-sale-widget.dart';
import '../../widgets/heading-widget.dart';
import 'all-categories-screen.dart';
import 'all-flash-sale-products.dart';
import 'all-products-screen.dart';
import 'cart-screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstants.textColor),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppConstants.secondaryColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: AppConstants.primaryColor,
        title: Text(
          AppConstants.appName ,
          style: TextStyle(color: AppConstants.textColor),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => CartScreen()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90.0,
              ),
              //banners
              BannerWidget(),

              //heading
              HeadingWidget(
                headingTitle: "Categories",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllCategoriesScreen()),
                buttonText: "See More >",
              ),

              CategoriesWidget(),

              //heading
              HeadingWidget(
                headingTitle: "Flash Sale",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllFlashSaleProductScreen()),
                buttonText: "See More >",
              ),

              FlashSaleWidget(),

              //heading
              HeadingWidget(
                headingTitle: "All Products",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllProductsScreen()),
                buttonText: "See More >",
              ),

              AllProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

