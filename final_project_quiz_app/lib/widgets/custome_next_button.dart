import 'package:flutter/material.dart';

class CustomeNextButton extends StatelessWidget {
  const CustomeNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ShapeDecoration(
          color: const Color(0xFF8E84FF),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF8D83FF)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: [
              Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 15,
              ),
            ],
          ),
        ));
  }
}
