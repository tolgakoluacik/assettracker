import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
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
      print("Received: $event");  // Log the incoming data for debugging
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
      backgroundColor: Colors.white,
      body: _currencies.currencyMap.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _currencies.currencyMap.length,
        itemBuilder: (context, index) {
          final currency = _currencies.currencyMap.values.elementAt(index);
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(currency.code),
              subtitle: Text(
                'Alış: ${currency.alis ?? 'Yok'}, Satış: ${currency.satis ?? 'Yok'}',
              ),
              trailing: Text('Kapanış: ${currency.kapanis ?? 'Yok'}'),
            ),
          );
        },
      ),
    );
  }
}
