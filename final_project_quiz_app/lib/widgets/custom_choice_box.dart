import 'package:flutter/material.dart';

class ChoiceBox extends StatefulWidget {
  const ChoiceBox({
    super.key,
    required this.textAnswer,
    required this.selectedAnswer,
    required this.onSelected,
  });
  final String textAnswer;
  final String? selectedAnswer;
  final Function(String?) onSelected;

  @override
  State<ChoiceBox> createState() => _ChoiceBoxState();
}

class _ChoiceBoxState extends State<ChoiceBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () {
          widget.onSelected(widget.textAnswer);
        },
        child: Container(
          height: 49,
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          decoration: ShapeDecoration(
            color: widget.selectedAnswer == widget.textAnswer
                ? const Color(0xFF8E84FF)
                : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9.50),
            ),
          ),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.selectedAnswer == widget.textAnswer
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: widget.selectedAnswer == widget.textAnswer
                    ? const Color(0xFF2B0063)
                    : const Color(0xFF2B0063),
              ),
              const SizedBox(width: 15),
              Text(
                widget.textAnswer,
                style: const TextStyle(
                  color: Color(0xFF2B0062),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
