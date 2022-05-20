import 'package:flutter/material.dart';
import 'dart:math';
class DemoBuildContext extends StatefulWidget {
  const DemoBuildContext({Key? key}) : super(key: key);

  @override
  State<DemoBuildContext> createState() => _DemoBuildContextState();
}

class _DemoBuildContextState extends State<DemoBuildContext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo inherited widget"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Center(
          child: OngBaWidget(
            child: ChaMe(
              child: ConCai(),
            ),
          ),
        ),
      ),
    );
  }
}

class OngBaWidget extends StatefulWidget {

  Widget child;

  String text = "Xin chao";
  int number = 0;

  OngBaWidget({required this.child});

  @override
  State<OngBaWidget> createState() => _OngBaWidgetState();
}

class _OngBaWidgetState extends State<OngBaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Ong ba"),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  widget.number = Random().nextInt(20);
                  widget.text = widget.number.toString();
                });
              },
              child: Text("Random ${widget.number}")
          ),
          MyInheritedWidget(child: widget.child, text: widget.text)
        ],
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget{
  Widget child;
  String text;

  MyInheritedWidget({required this.child , required this.text}) : super(child: child);

  static MyInheritedWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    return oldWidget.text != text;
  }
}

class ChaMe extends StatefulWidget {

  Widget child;

  ChaMe({required this.child});

  @override
  State<ChaMe> createState() => _ChaMeState();
}

class _ChaMeState extends State<ChaMe> {

  @override
  void didChangeDependencies() {
    print("Cha me didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    MyInheritedWidget? myInheritedWidget = MyInheritedWidget.of(context);
    print("Cha me build");
    return Container(
      child: Column(
        children: [
          Text("Cha me"),
          widget.child
        ],
      ),
    );
  }
}

class ConCai extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("Con cai build");
    MyInheritedWidget? myInheritedWidget = MyInheritedWidget.of(context);
    return Container(
      child: Column(
        children: [
          Text("Con cai"),
          Text("${myInheritedWidget?.text}")
        ],
      ),
    );
  }
}