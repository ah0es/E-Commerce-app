import 'package:flutter/cupertino.dart';

import 'form_error_message.dart';



class ErrorMessages extends StatelessWidget {
  const ErrorMessages({
    super.key,
    required this.errorMessage,
  });

  final List<String> errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errorMessage.length,
        (index) => FormErrorMessage(
          errorMessage: errorMessage,
          index: index,
        ),
      ),
    );
  }
}
