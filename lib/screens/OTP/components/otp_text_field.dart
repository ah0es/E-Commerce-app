
import 'package:flutter/material.dart';

import '../../../helper/constants.dart';

class OtpTextfeild extends StatefulWidget {
  const OtpTextfeild(
      {super.key, this.onChanged, this.autofocus = false, this.focusNode});
  final void Function(String)? onChanged;
  final bool autofocus;
  final FocusNode? focusNode;

  @override
  State<OtpTextfeild> createState() => _OtpTextfeildState();
}

class _OtpTextfeildState extends State<OtpTextfeild> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      child: TextFormField(
        keyboardType: TextInputType.number,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        onChanged: widget.onChanged,
        obscureText: true,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: kTextColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: kTextColor),
          ),
        ),
      ),
    );
  }
}