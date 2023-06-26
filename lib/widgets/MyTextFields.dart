import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String assetImage;
  String myHintText;
  Function(String) myFunction;
  MyTextField({Key? key,required this.assetImage,required this.myHintText,required this.myFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      onChanged: myFunction,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFFFFFFF),
        prefixIcon: Image(
            image: AssetImage(
                assetImage)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: myHintText,
      ),
    );
  }
}

