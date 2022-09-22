import 'package:flutter/material.dart';

// ignore: camel_case_types
class card extends StatelessWidget {
  const card({
    Key key,
    @required this.crypto,
    @required this.rate,
    @required this.selectedcurrency,
  }) : super(key: key);

  final String crypto;
  final String rate;
  final String selectedcurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.pink[200],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $rate $selectedcurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
