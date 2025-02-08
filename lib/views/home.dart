import 'dart:async';
import 'dart:convert';
import 'package:asset_tracker/constants/app_currencies.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../constants/theme_colors.dart';
import '../models/currencies_model.dart';

class HomeScreen extends StatefulWidget {
  final String email;

  const HomeScreen({required this.email, super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late final WebSocketChannel _channel;
  Currencies _currencies = Currencies(currencyMap: {});

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

          if (currencyData != null && currencyData is Map<String, dynamic>) {
            setState(() {
              _currencies = Currencies.fromJson(jsonEncode(currencyData));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: _currencies.currencyMap.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        itemCount: _currencies.currencyMap.length,
        itemBuilder: (context, index) {
          final currency = _currencies.currencyMap.values.elementAt(index);
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
                'Alış: $buyValue, Satış: $sellValue',
                style: const TextStyle(
                  color: AppColors.mainTextColor,
                  fontSize: 14,
                ),
              ),
              trailing: Text(
                'Kapanış: $endValue',
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
