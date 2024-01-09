import 'package:flutter/material.dart';

import '../../../../../constants/export.dart';

class AuthTextfield extends StatelessWidget {
  const AuthTextfield({
    super.key,
    this.controller,
    this.keyboardtype,
    this.validator,
    this.obscure,
    this.prefixicon,
    this.suffixicon,
    this.hintext,
  });
  final TextEditingController? controller;
  final TextInputType? keyboardtype;
  final String? Function(String?)? validator;
  final bool? obscure;
  final Widget? prefixicon, suffixicon;
  final String? hintext;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return TextFormField(
      obscuringCharacter: '*',
      obscureText: obscure ?? false,
      cursorColor: Appcolors.blue,
      controller: controller,
      keyboardType: keyboardtype,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
          suffixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Appcolors.blue
                  : Appcolors.lightgrey),
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Appcolors.blue
                  : Appcolors.lightgrey),
          filled: true,
          fillColor: Appcolors.lightgrey.withOpacity(0.3),
          contentPadding: EdgeInsets.zero,
          prefixIcon: prefixicon,
          suffixIcon: suffixicon,
          hintText: hintext,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                size.width * 0.02,
              ),
              borderSide: BorderSide(color: Appcolors.blue)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                size.width * 0.02,
              ),
              borderSide: BorderSide(color: Appcolors.lightgrey))),
    );
  }
}
