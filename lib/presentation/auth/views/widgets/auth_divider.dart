import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(child: Divider()),
          SizedBox(
            width: 5,
          ),
          Text('Or'),
          SizedBox(
            width: 5,
          ),
          Expanded(child: Divider()),
        ],
      ),
    );
  }
}
