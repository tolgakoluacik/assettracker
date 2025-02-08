import 'dart:async';
import 'dart:convert';
import 'package:asset_tracker/constants/app_currencies.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../constants/theme_colors.dart';
import '../models/currencies_model.dart';
import '../models/currency_model.dart';

class HomeScreen extends StatefulWidget {
  final String email;

  const HomeScreen({required this.email, super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late final WebSocketChannel _channel;
  Currencies _currencies = Currencies(currencyMap: {});
  final TextEditingController _searchController = TextEditingController();
  List<Currency> filteredCurrencies = [];

  @override
  void initState() {
    super.initState();
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://socket.haremaltin.com/socket.io/?EIO=4&transport=websocket'),
    );

    _channel.stream.listen((event) {
      if (event.toString().startsWith('0')) {
        _channel.sink.add('40');
      } else if (event.toString().startsWith('42')) {
        try {
          final currencyData = jsonDecode(event.substring(2))[1]["data"];
          print(currencyData);
          if (currencyData != null && currencyData is Map<String, dynamic>) {
            setState(() {
              _currencies = Currencies.fromJson(jsonEncode(currencyData));
              onSearch(_searchController.text);
            });
          }

          Timer(const Duration(seconds: 5), () {
            _channel.sink.add('40');
          });
        } catch (e) {
          debugPrint("WebSocket data parsing error: $e");
        }
      }
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  void onSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCurrencies = _currencies.currencyMap.values.toList();
      } else {
        filteredCurrencies = _currencies.currencyMap.values
            .where((currency) =>
        currency.code.toLowerCase().contains(query.toLowerCase()) ||
            AppCurrencies.currencies[currency.code]!.toLowerCase().contains(query.toLowerCase()) ?? false)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        title: const Text('Asset Tracker', style: TextStyle(color: AppColors.mainTextColor),),
        backgroundColor: AppColors.appBackground,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 250,
              child: TextField(
                controller: _searchController,
                onChanged: (query) {
                  onSearch(query);
                },
                style: const TextStyle(color: AppColors.mainTextColor),
                decoration: InputDecoration(
                  hintText: 'Search Currency',
                  hintStyle: const TextStyle(color: AppColors.mainTextColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(8),
                ),
              ),
            ),
          ),
        ],
      ),
      body: filteredCurrencies.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        itemCount: filteredCurrencies.length,
        itemBuilder: (context, index) {
          final currency = filteredCurrencies[index];
          final currencyName = AppCurrencies.currencies[currency.code] ?? currency.code;
          final buyValue = currency.buy ?? 'Yok';
          final sellValue = currency.sell ?? 'Yok';
          final endValue = currency.end ?? 'Yok';

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.white,
            shadowColor: AppColors.mainTextColor,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              title: Text(
                currencyName,
                style: const TextStyle(
                  color: AppColors.mainTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Buy: $buyValue, Sell: $sellValue',
                style: const TextStyle(
                  color: AppColors.mainTextColor,
                  fontSize: 14,
                ),
              ),
              trailing: Text(
                'End: $endValue',
                style: const TextStyle(
                  color: AppColors.mainTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
