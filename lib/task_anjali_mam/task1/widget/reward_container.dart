import 'package:flutter/material.dart';
class RewardContainer extends StatelessWidget {
  const RewardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
