import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:product_list/button.dart';
import 'package:product_list/details.dart';
import 'package:product_list/expanionlist.dart';
import 'package:product_list/price.dart';
import 'package:product_list/productdata.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  getdata() async {
    var data = await ProductData().getData();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartDetails(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product List"),
          actions: [Cart()],
        ),
        body: SafeArea(
            child: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                  physics: ClampingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 2,
                      color: Colors.grey,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ProductsCard(
                      productData: snapshot.data[index],
                    );
                  },
                  itemCount: snapshot.data.length);
            }
          },
        )),
      ),
    );
  }
}

class ProductsCard extends StatefulWidget {
  final productData;
  ProductsCard({this.productData});
  @override
  _ProductsCardState createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    padding: EdgeInsets.only(left: 60, top: 10),
                    child: SizedBox(
                      height: 300,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: Text(
                              widget.productData.images[index],
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                        scale: .8,
                        itemCount: 2,
                        pagination: SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                                color: Colors.grey,
                                activeColor: Colors.black,
                                space: 4.0)),
                      ),
                    )),
                Positioned(
                    left: 10,
                    top: 0,
                    child: Text(
                      "BRAND: ${widget.productData.brand}\n${widget.productData.title}",
                      style: TextStyle(
                        color: Colors.cyan[700],
                        fontSize: 20,
                      ),
                    )),
                Positioned(
                    right: 0,
                    top: 0,
                    child: Expansion(
                      head: "Size",
                      txt1: widget.productData.clothsize[0],
                      txt2: widget.productData.clothsize[1],
                      txt3: widget.productData.clothsize[2],
                      txt4: widget.productData.clothsize[3],
                    ))
              ],
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey,
            ),
            Expansion(
                head: "Color",
                txt1: widget.productData.colors[0],
                txt2: widget.productData.colors[1],
                txt3: widget.productData.colors[2],
                txt4: widget.productData.colors[3]),
            Divider(
              thickness: 1.5,
              color: Colors.grey,
            ),
            Price(
              price: widget.productData.price,
              discount: widget.productData.discountprice,
              dspercent: widget.productData.discountpercentage,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                widget.productData.description,
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.clip,
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey,
            ),
            Details(
              varients: "Varient",
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey,
            ),
            Button(
              product: widget.productData,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, top: 10),
              child: Text(
                "Availability : ${widget.productData.availability}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, top: 5),
              child: Text(
                  "Offer Shipping : ${widget.productData.offershipping}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey,
            ),
            Details(
              data: widget.productData,
            )
          ],
        ),
      ),
    );
  }
}

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 15, top: 10),
          child: Icon(
            (Icons.shopping_cart_outlined),
            size: 35,
          ),
        ),
        Provider.of<CartDetails>(context, listen: true).itemsInCart != 0
            ? Positioned(
                right: 5,
                child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.yellow,
                    child: Consumer<CartDetails>(
                      builder: (context, data, child) {
                        return Text(
                          data.itemsInCart.toString(),
                          style: TextStyle(color: Colors.black),
                        );
                      },
                    )),
              )
            : Container()
      ],
    );
  }
}

class CartDetails extends ChangeNotifier {
  int itemsInCart = 0;
  void change(bool cartpressed) {
    if (cartpressed) {
      itemsInCart += 1;
    } else {
      if (itemsInCart != 0) {
        itemsInCart -= 1;
      }
    }
    notifyListeners();
  }
}
