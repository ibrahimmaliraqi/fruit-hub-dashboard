import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_text_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                controller: TextEditingController(),

                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
