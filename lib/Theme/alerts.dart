import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

snack(context, String x) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: AutoSizeText(
    x,
    maxLines: 2,
  )));
}
