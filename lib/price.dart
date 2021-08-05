import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  final String price, discount, dspercent;
  Price({this.price, this.discount, this.dspercent});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8),
        child: RichText(
          text: TextSpan(
              style: TextStyle(fontSize: 20, color: Colors.black),
              children: [
                TextSpan(
                  text: "₹$price",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough),
                ),
                TextSpan(
                  text: "  ₹$discount",
                ),
                TextSpan(
                    text: "  ${dspercent}Off",
                    style: TextStyle(color: Colors.green))
              ]),
        ));
  }
}
