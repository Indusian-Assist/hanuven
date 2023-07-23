import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOTPField extends StatelessWidget {
  const CustomOTPField({
    super.key,
    required this.onChanged,
  });
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      width: size.width * 0.12,
      child: TextFormField(
        onChanged: onChanged,

        decoration:
            const InputDecoration(hintText: "0", border: OutlineInputBorder()),
        //style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
