import 'package:flutter/material.dart';



Widget navbar() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 65.0,
      decoration: BoxDecoration(
        color: Color(0xFF191931),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/minilogo.png',
            width: 90,
            height: 90,
          ),
          IconButton(
            icon: Image.asset(
              'assets/menu.png',
              width: 28,
              height: 28,
            ),
            onPressed: () {
              // Handle custom menu icon press
            },
          ),
        ],
      ),
    ),
  );
}