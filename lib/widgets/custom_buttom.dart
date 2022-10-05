import 'package:flutter/material.dart';


import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Color color;

  final VoidCallback onPress;

  CustomButton({
     required  this.onPress,
      this.text = 'Write text ',
       this.color = Colors.cyan,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:onPress,
      child: Container(height: 50,

        decoration: BoxDecoration(color: Colors.cyan,borderRadius: BorderRadius.circular(20)),
        child: CustomText(
          alignment: Alignment.center,
          text: text,
          color: Colors.white,
        ),
      ),
    );
  }
}
