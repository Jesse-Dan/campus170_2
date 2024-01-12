import 'package:flutter/material.dart';

class BaseBody extends StatelessWidget {
  const BaseBody({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: _child);
  }
}
