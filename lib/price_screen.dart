import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedcurrency = 'USD';
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedcurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedcurrency = value;
          getconversion();
        });
      },
    );
  }

  Map<String, String> coinvalues = {};
  bool iswaiting = false;

  void getconversion() async {
    iswaiting = true;
    Networkhelper conversion = Networkhelper(selectedcurrency);
    try {
      var exchangedata = await conversion.getdata();
      iswaiting = false;
      setState(() {
        coinvalues = exchangedata;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getconversion();
  }

  Column makecards() {
    List<Widget> cryptocards = [];
    for (String crypto in cryptoList) {
      cryptocards.add(
        card(
            crypto: crypto,
            rate: iswaiting ? '?' : coinvalues[crypto],
            selectedcurrency: selectedcurrency),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptocards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          makecards(),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.pink[200],
              child: androidDropdown()),
        ],
      ),
    );
  }
}
