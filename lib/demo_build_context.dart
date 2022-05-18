import 'package:flutter/material.dart';
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
          widget.child
        ],
      ),
    );
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
  Widget build(BuildContext context) {
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
    return Container(
      child: Column(
        children: [
          Text("Con cai"),
        ],
      ),
    );
  }
}



