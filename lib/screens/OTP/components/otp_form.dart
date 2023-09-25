import 'package:flutter/cupertino.dart';

import 'otp_text_field.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    super.key,
  });

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FoucsNode;
  FocusNode? pin3FoucsNode;
  FocusNode? pin4FoucsNode;
  @override
  void initState() {
    pin2FoucsNode = FocusNode();
    pin3FoucsNode = FocusNode();
    pin4FoucsNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    pin2FoucsNode!.dispose();
    pin3FoucsNode!.dispose();
    pin4FoucsNode!.dispose();
    super.dispose();
  }

  void nextfoucs(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OtpTextfeild(
          onChanged: (value) {
            nextfoucs(value, pin2FoucsNode!);
          },
          autofocus: true,
        ),
        OtpTextfeild(
          onChanged: (value) {
            nextfoucs(value, pin3FoucsNode!);
          },
          focusNode: pin2FoucsNode,
        ),
        OtpTextfeild(
          onChanged: (value) {
            nextfoucs(value, pin4FoucsNode!);
          },
          focusNode: pin3FoucsNode,
        ),
        OtpTextfeild(
          onChanged: (value) {
            pin4FoucsNode!.unfocus();
          },
          focusNode: pin4FoucsNode,
        ),
      ],
    );
  }
}