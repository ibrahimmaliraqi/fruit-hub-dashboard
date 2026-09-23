import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/router/app_router.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: "اضافة منتج",
              onTap: () => GoRouter.of(context).push(AppRouter.addProductView),
            ),
            Gap(16),
            CustomButton(text: "الطلبات"),
          ],
        ),
      ),
    );
  }
}
