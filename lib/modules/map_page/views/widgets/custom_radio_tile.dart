import 'package:flutter/material.dart';

class CustomRadioTile extends StatelessWidget {
  final bool isActive;
  final VoidCallback onChanged;
  final String title;
  final MainAxisAlignment mainAxisAlignment;

  const CustomRadioTile({
    required this.isActive,
    required this.onChanged,
    required this.title,
    this.mainAxisAlignment = MainAxisAlignment.start,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged,
      splashColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Radio<bool>(
              value: true,
              groupValue: isActive,
              activeColor: const Color(0xFF0068FF),
              onChanged: (v) => onChanged(),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: FittedBox(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF17181A),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 1.45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
