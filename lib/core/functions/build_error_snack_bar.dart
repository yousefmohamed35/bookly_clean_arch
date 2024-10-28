import 'package:booklycleanarch/core/utils/styles.dart';
import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(String errorMessage) {
  return SnackBar(
    backgroundColor: Colors.red,
    duration: Duration(milliseconds: 2000),
    content: Text(
      errorMessage,
      style: Styles.textStyle20,
    ),
  );
}
