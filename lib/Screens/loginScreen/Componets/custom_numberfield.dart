import 'package:flutter/material.dart';
class CustomNumberField extends StatelessWidget {
  const CustomNumberField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: 250,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: TextField(
                autocorrect: true,
                decoration:
                    InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              width: 18,
            ),
            Expanded(
              child: TextField(
                decoration:
                    InputDecoration(border: InputBorder.none),
              ),
            )
          ],
        ));
  }
}
