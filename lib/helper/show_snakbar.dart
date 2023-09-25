import 'package:ecommerce_app/helper/constants.dart';
import 'package:flutter/material.dart';

void showSnakBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(
        seconds: 3,
      ),
      backgroundColor: kPrimaryColor,
      elevation: 6.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
      ),
      content: Row(
        children: [
          const Icon(Icons.star, color: Colors.yellow, size: 24.0),
          const SizedBox(width: 8.0),
          Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ],
      ),
    ),
  );
}
