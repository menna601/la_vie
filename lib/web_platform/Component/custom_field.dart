import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constansts.dart';

class CustomField extends StatelessWidget {
  CustomField(
      {this.label,
      this.hint,
      this.borderColor,
      this.height,
      this.border = true,
      required this.onChanged});
  final String? label;
  final String? hint;
  final Color? borderColor;
  final double? height;
  final Function(String) onChanged;
  final bool border;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height != null
          ? height
          : kIsWeb
              ? 104
              : 75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!,
              style: kIsWeb ? k20_500DarkGreyText : k14_500GreyText,
            ),
          if (label != null) SizedBox(height: 10),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                  hintText: hint,
                  focusedBorder: border
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFF1ABC00)))
                      : InputBorder.none,
                  border: border
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))
                      : InputBorder.none),
              cursorColor: borderColor ?? Color(0xFF1ABC00),
            ),
          ),
        ],
      ),
    );
  }
}
