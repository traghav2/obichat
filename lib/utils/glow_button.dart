import 'package:flutter/material.dart';

class BlueGlowFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const BlueGlowFAB({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: Colors.green.shade500,
          elevation: 8.0,
          highlightElevation: 12.0,
          shape: const CircleBorder(),
          heroTag: null,
          child: const Icon(Icons.add, color: Colors.white,size: 25),
        ),
      ),
    );
  }
}
