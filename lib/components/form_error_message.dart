import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class FormErrorMessage extends StatelessWidget {
  const FormErrorMessage({
    super.key,
    required this.errorMessage,
    required this.index,
  });

  final List<String> errorMessage;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: 15,
          width: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(errorMessage[index]),
      ],
    );
  }
}
