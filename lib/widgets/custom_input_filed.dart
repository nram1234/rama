import 'package:flutter/material.dart';

class Custom_Input_Filed extends StatelessWidget {
  final int maxline;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(controller: textEditingController,
        textAlign: TextAlign.center,
        obscureText: obscureText,
        maxLines: maxline,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey)),
          labelText: label,
        ),
      ),
    );
  }

  Custom_Input_Filed(
      {required this.maxline,
        required  this.label,
      this.obscureText=false,
        required  this.keyboardType,
        required this.textEditingController,
 });
}
