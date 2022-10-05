import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final Function onPress;

  CustomButtonSocial({
     required  this.text,
    required this.imageName,
    required  this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      onPress();
    },
      child: Row(
        children: [
          Image.asset(imageName),
          SizedBox(
            width: 100,
          ),
          CustomText(
            text: text,
          ),
        ],
      ),
    );
  }
}
