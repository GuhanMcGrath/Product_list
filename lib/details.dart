import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final data, varients;
  Details({this.data, this.varients});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool expanddetails = false;
  List detailsList = [];
  String selectedVarient = "";
  @override
  void initState() {
    if (widget.varients == null) {
      detailsList = [
        [widget.data.location, widget.data.contactdetails],
        [widget.data.createddate, widget.data.modifieddate],
        [widget.data.tag, widget.data.condition]
      ];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.varients == null
                ? "Details"
                : "Item Varient : $selectedVarient",
            style: TextStyle(fontSize: 18),
          ),
          trailing: AnimatedIconButton(
              splashColor: Colors.transparent,
              duration: Duration(milliseconds: 450),
              onPressed: () {
                Future.delayed(Duration(milliseconds: 400), () {
                  setState(() {
                    expanddetails = !expanddetails;
                  });
                });
              },
              icons: [
                AnimatedIconItem(
                    icon: Icon(
                  Icons.expand_more,
                  color: Colors.grey,
                )),
                AnimatedIconItem(
                    icon: Icon(
                  Icons.expand_less,
                  color: Colors.grey,
                ))
              ]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Visibility(
            visible: expanddetails,
            child: widget.varients == "Varient"
                ? Row(
                    children: [
                      Varient(
                        varient: "Varient 1",
                        selectVarient: () {
                          setState(() {
                            selectedVarient = "Varient 1";
                          });
                        },
                      ),
                      Varient(
                        varient: "Varient 2",
                        selectVarient: () {
                          setState(() {
                            selectedVarient = "Varient 2";
                          });
                        },
                      ),
                      Varient(
                        varient: "Varient 3",
                        selectVarient: () {
                          setState(() {
                            selectedVarient = "Varient 3";
                          });
                        },
                      )
                    ],
                  )
                : Container(
                    child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        DetailsCard(
                          title1: "Location",
                          details1: detailsList[0][0],
                          title2: "Contact",
                          details2: detailsList[0][1],
                        ),
                        DetailsCard(
                          title1: "Created_Date",
                          details1: detailsList[1][0],
                          title2: "Modified_date",
                          details2: detailsList[1][1],
                        ),
                        DetailsCard(
                          title1: "Tag",
                          details1: detailsList[2][0],
                          title2: "Contidion",
                          details2: detailsList[2][1],
                        ),
                      ],
                    ),
                  )),
          ),
        ),
      ],
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String details1, details2;
  final String title1, title2;
  DetailsCard({this.details1, this.details2, this.title1, this.title2});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black54),
        ),
        width: 200,
        height: 90,
        child: RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 15),
                children: [
              TextSpan(
                  text: "$title1\n",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
              TextSpan(text: "  $details1\n"),
              TextSpan(
                  text: "$title2\n",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
              TextSpan(text: "  $details2")
            ])),
      ),
    );
  }
}

class Varient extends StatelessWidget {
  final String varient;
  final Function selectVarient;
  Varient({@required this.selectVarient, this.varient});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          height: 50,
          width: 100,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey[300],
              ),
              onPressed: selectVarient,
              child: Text(
                varient,
                style: TextStyle(color: Colors.black),
              ))),
    );
  }
}
