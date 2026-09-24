import 'package:flutter/material.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  final ValueChanged<bool?> onChange;

  const IsFeaturedCheckBox({
    super.key,
    required this.onChange,
  });

  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isFeatured = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'المنتج مميز',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Checkbox(
          value: isFeatured,
          onChanged: (value) {
            setState(() {
              isFeatured = value ?? false;
            });

            widget.onChange(isFeatured);
          },
        ),
      ],
    );
  }
}
