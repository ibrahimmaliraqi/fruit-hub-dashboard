import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_dashboard/core/widgets/snack.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/widgets/ImageField.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/widgets/IsFeaturedCheckBox.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/widgets/IsOrganciCheckBox.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController expirationMonthsController =
      TextEditingController();
  final TextEditingController numberOfCaloriesController =
      TextEditingController();
  final TextEditingController unitAmountController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  File? image;

  bool isFeatured = false;
  bool isOrganic = false;

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    expirationMonthsController.dispose();
    numberOfCaloriesController.dispose();
    unitAmountController.dispose();
    codeController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: nameController,
                hintText: 'اسم المنتج',
                textInputType: TextInputType.text,
              ),

              const SizedBox(height: 16),

              CustomTextField(
                controller: priceController,
                hintText: 'سعر المنتج',
                textInputType: TextInputType.number,
              ),

              const SizedBox(height: 16),

              CustomTextField(
                controller: expirationMonthsController,
                hintText: 'مدة الصلاحية بالأشهر',
                textInputType: TextInputType.number,
              ),

              const SizedBox(height: 16),

              CustomTextField(
                controller: numberOfCaloriesController,
                hintText: 'عدد السعرات الحرارية',
                textInputType: TextInputType.number,
              ),

              const SizedBox(height: 16),

              CustomTextField(
                controller: unitAmountController,
                hintText: 'كمية الوحدة',
                textInputType: TextInputType.number,
              ),

              const SizedBox(height: 16),

              CustomTextField(
                controller: codeController,
                hintText: 'رمز المنتج',
                textInputType: TextInputType.text,
              ),

              const SizedBox(height: 16),

              CustomTextField(
                controller: descriptionController,
                hintText: 'وصف المنتج',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),

              const SizedBox(height: 16),

              IsOrganciCheckBox(
                onChange: (value) {
                  setState(() {
                    isOrganic = value!;
                  });
                  print(isOrganic);
                },
              ),

              IsFeaturedCheckBox(
                onChange: (value) {
                  setState(() {
                    isFeatured = value!;
                  });
                  print(isFeatured);
                },
              ),
              const SizedBox(height: 16),

              ImageField(
                onFileChanged: (selectedImage) {
                  setState(() {
                    image = selectedImage;
                  });
                },
              ),
              const SizedBox(height: 24),

              CustomButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    if (image == null) {
                      Snack.show(
                        context,
                        message: 'لازم تخلي صورة',
                        isError: true,
                      );
                    } else {
                      log('كامل');
                    }
                  }
                },
                text: 'إضافة المنتج',
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('يرجى اختيار صورة'),
      ),
    );
  }
}
