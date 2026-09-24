import 'package:flutter/material.dart';

class IsOrganciCheckBox extends StatefulWidget {
  final ValueChanged<bool?> onChange;
  const IsOrganciCheckBox({super.key, required this.onChange});

  @override
  State<IsOrganciCheckBox> createState() => _IsOrganciCheckBoxState();
}

class _IsOrganciCheckBoxState extends State<IsOrganciCheckBox> {
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'المنتج عضوي',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Checkbox(
          value: isOrganic,
          onChanged: (value) {
            setState(() {
              isOrganic = value ?? false;
            });
            widget.onChange(isOrganic);
          },
        ),
      ],
    );
  }
}
