import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const MenuButton({Key key, this.text, this.color, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: 50,
          width: 0.7 * MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(right: 20, top: 15, bottom: 10),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              text,
              style: TextStyle( fontFamily:'Montserrat',
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: onTap);
  }
}
