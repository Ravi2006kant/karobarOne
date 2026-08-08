import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isliked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isliked = !isliked;
        });
      },
      icon: Icon(
        isliked ? Icons.favorite : Icons.favorite_border_rounded,
        color: isliked ? Colors.red : Colors.white,
      ),
    );
  }
}
