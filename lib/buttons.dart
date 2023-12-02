import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const CalcButton({
    
    required this.text,
    required this.fillColor,
    required this.textColor,
    this.textSize = 28,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: fillColor != null ? Color(fillColor) : null,
      child: SizedBox(
        width: 65,
        height: 65,
        child: Center(
          child: InkWell(
            borderRadius : BorderRadius.circular(50),
            onTap: () {
              callback(text);
            },
            child: Text(
              text,
              style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontSize: textSize,
                  color: Color(textColor)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
