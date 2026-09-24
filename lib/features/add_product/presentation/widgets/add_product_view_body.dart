import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruit_hub_dashboard/core/widgets/loading.dart';
import 'package:fruit_hub_dashboard/core/widgets/snack.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/product.dart';
import 'package:fruit_hub_dashboard/features/add_product/presentation/manager/add_product/add_product_cubit.dart';
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

              BlocConsumer<AddProductCubit, AddProductState>(
                listener: (context, state) {
                  if (state is AddProductSuccess) {
                    Snack.show(context, message: "تمت اضافه العنصر بنجاح");
                  }
                  if (state is AddProductFailure) {
                    Snack.show(
                      context,
                      message: state.errMessage,
                      isError: true,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AddProductLoading) {
                    return Loading();
                  }
                  return CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (image == null) {
                          Snack.show(
                            context,
                            message: 'لازم تخلي صورة',
                            isError: true,
                          );
                        } else {
                          final product = ProductEntity(
                            name: nameController.text,
                            code: codeController.text.toLowerCase(),
                            description: descriptionController.text,
                            price: num.parse(priceController.text),
                            expirationsMonths: int.parse(
                              expirationMonthsController.text,
                            ),
                            numberOfCalories: int.parse(
                              numberOfCaloriesController.text,
                            ),
                            unitAmount: int.parse(unitAmountController.text),
                            image: image!,
                            isFeatured: isFeatured,
                            isOrganic: isOrganic,
                            reviews: [],
                          );
                          context.read<AddProductCubit>().addProduct(
                            product: product,
                          );
                        }
                      }
                    },
                    text: 'إضافة المنتج',
                  );
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
