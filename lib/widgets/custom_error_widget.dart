import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
    required this.message,
    this.onPressed,
  }) : super(key: key);

  final String message;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Error Occured'),
          Text(message),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          )
        ],
      ),
    );
  }
}
