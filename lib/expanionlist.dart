import "package:flutter/material.dart";
import 'package:animated_icon_button/animated_icon_button.dart';

class Expansion extends StatefulWidget {
  final String head, txt1, txt2, txt3, txt4;
  Expansion(
      {@required this.head,
      @required this.txt1,
      @required this.txt2,
      @required this.txt3,
      @required this.txt4});
  @override
  _ExpansionState createState() => _ExpansionState();
}

class _ExpansionState extends State<Expansion> {
  bool expanded = false;
  bool expandedSize = false;
  String color = "";
  String size = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.head == "Color"
            ? ListTile(
                title: Text(
                  "${widget.head}\n$color",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: AnimatedIconButton(
                      splashColor: Colors.transparent,
                      duration: Duration(milliseconds: 450),
                      onPressed: () {
                        Future.delayed(Duration(milliseconds: 400), () {
                          setState(() {
                            expanded = !expanded;
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
              )
            : Container(
                height: 50,
                width: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: Row(
                  children: [
                    Text(
                      "${widget.head}\n  $size",
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: AnimatedIconButton(
                          animationDirection: AnimationDirection.reverse(),
                          splashColor: Colors.transparent,
                          duration: Duration(milliseconds: 450),
                          onPressed: () {
                            Future.delayed(Duration(milliseconds: 400), () {
                              setState(() {
                                expandedSize = !expandedSize;
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
                    )
                  ],
                ),
              ),
        Visibility(
            visible: expanded | expandedSize,
            child: widget.head == "Color"
                ? Row(children: [
                    Containers(
                      txt: widget.txt1,
                      txt1: " ",
                      radius: BorderRadius.circular(10),
                      selected: () {
                        setState(() {
                          color = widget.txt1;
                        });
                      },
                    ),
                    Containers(
                      txt: widget.txt2,
                      txt1: " ",
                      radius: BorderRadius.circular(10),
                      selected: () {
                        setState(() {
                          color = widget.txt2;
                        });
                      },
                    ),
                    Containers(
                      txt: widget.txt3,
                      txt1: " ",
                      radius: BorderRadius.circular(10),
                      selected: () {
                        setState(() {
                          color = widget.txt3;
                        });
                      },
                    ),
                    Containers(
                      txt: widget.txt4,
                      txt1: " ",
                      radius: BorderRadius.circular(10),
                      selected: () {
                        setState(() {
                          color = widget.txt4;
                        });
                      },
                    )
                  ])
                : Column(children: [
                    Containers(
                      txt1: widget.txt1,
                      selected: () {
                        setState(() {
                          size = widget.txt1;
                        });
                      },
                    ),
                    Containers(
                      txt1: widget.txt2,
                      selected: () {
                        setState(() {
                          size = widget.txt2;
                        });
                      },
                    ),
                    Containers(
                        txt1: widget.txt3,
                        selected: () {
                          setState(() {
                            size = widget.txt3;
                          });
                        }),
                    Containers(
                        txt1: widget.txt4,
                        selected: () {
                          setState(() {
                            size = widget.txt4;
                          });
                        })
                  ]))
      ],
    );
  }
}

class Containers extends StatelessWidget {
  final String txt, txt1;
  final Function selected;
  final BorderRadius radius;
  Containers({this.txt, this.selected, this.radius, this.txt1});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selected,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: txt == "Blue"
                    ? Colors.blue
                    : txt == "Yellow"
                        ? Colors.yellow
                        : txt == "Red"
                            ? Colors.red
                            : Colors.white,
                borderRadius: radius ?? BorderRadius.circular(0),
                border: txt == "white" || txt == null
                    ? Border.all(color: Colors.black)
                    : null),
            height: 30,
            width: 60,
            child: Text(txt1),
          )),
    );
  }
}
