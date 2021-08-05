import 'dart:convert';
import 'package:product_list/productmodel.dart';
import 'package:http/http.dart' as ht;

class ProductData {
  List<Product> productdata = [];
  Future getData() async {
    var response = await ht.get(Uri.parse(
        "https://softawork2.xyz/fandlApi/product/get_all_product_list"));
    var responsedata = jsonDecode(response.body);
    if (responsedata["status"] == 200) {
      responsedata["productAllList"].forEach((element) {
        Product product = Product(
            id: element["id"],
            title: element["title"],
            description: element["description"],
            price: element["price"],
            categoryid: element["category_id"],
            location: element["location"],
            contactdetails: element["contact_details"],
            tag: element["tag"],
            images: element["images"].split(","),
            userid: element["user_id"],
            userbussinessid: element["user_bussiness_id"],
            boostid: element["boost_id"],
            availability: element["availability"],
            offershipping: element["offer_shipping"],
            condition: element["condition"],
            additemvarient: element["add_item_varient"],
            devicename: element["device_name"],
            brand: element["brand"],
            chooseprivacysettings: element["choose_privacy_settings"],
            actualprice: element["actual_price"],
            discountprice: element["discount_price"],
            discountpercentage: element["discount_precentage"],
            createddate: element["created_date"],
            modifieddate: element["modified_date"],
            clothsize: element["cloth_size"].split(","),
            colors: element["colors"].split(","));
        productdata.add(product);
      });
    }
    return productdata;
  }
}
