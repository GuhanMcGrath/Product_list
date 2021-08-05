import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_list/home.dart';
import 'package:provider/provider.dart';

class Button extends StatefulWidget {
  var product;
  Button({this.product});
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CartDetails>(context);
    return Padding(
      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 187,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.red[600],
                    elevation: 10,
                    shadowColor: Colors.cyan[900]),
                child: Text("Buy Now",
                    style: GoogleFonts.openSans(
                        color: Colors.white, fontSize: 20))),
          ),
          SizedBox(
            width: 5,
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width / 2 - 10,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.product.cart = !widget.product.cart;
                  data.change(widget.product.cart);
                });
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange[600],
                  elevation: 10,
                  shadowColor: Colors.cyan[900]),
              child: Text(
                widget.product.cart ? "Remove" : "Add to Cart",
                style: GoogleFonts.openSans(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
