import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add-product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(text: "اضف منتج"),
      body: const AddProductViewBody(),
    );
  }
}
