import 'package:http/http.dart' as http;
import 'dart:convert';

const apikey = '2D5E40DA-C28A-4982-B435-D66C63CC559E';

class Networkhelper {
  final String selectedcurrency;
  Networkhelper(this.selectedcurrency);

  Future getdata() async {
    Map<String, String> crytoPrices = {};
    for (String crypto in cryptoList) {
      http.Response response = await http.get(
        Uri.parse(
            'https://rest.coinapi.io/v1/exchangerate/$crypto/$selectedcurrency?apikey=$apikey'),
      );

      if (response.statusCode == 200) {
        var decodeddata = jsonDecode(response.body);
        double price = decodeddata['rate'];
        crytoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
      }
    }
    return crytoPrices;
  }
}

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
