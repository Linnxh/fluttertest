import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  IconData icon;
  String text;
  GestureTapCallback onTap;

  // 构造方法
  CustomIconButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                icon,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor),
            ),
            Text(text, style: TextStyle(fontSize: 12.0, height: 1.5))
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
