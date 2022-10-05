import 'package:flutter/material.dart';

class WidgetError extends StatelessWidget {
  const WidgetError({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Ups...\nAlgo salio mal'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onTap,
          child: const Text('Intentar nuevamente'),
        ),
      ],
    );
  }
}
