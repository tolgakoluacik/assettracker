import 'dart:convert';
import 'dart:io';
import 'package:asset_tracker/views/login_screen.dart';
import 'package:asset_tracker/widgets/custom_button.dart';
import 'package:asset_tracker/widgets/empty_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../models/currencies_model.dart';

const requestId = 305;

class HomeScreen extends StatefulWidget {
  final String email;

  const HomeScreen({
    required this.email,
    super.key,
  });

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late String email;
  late String password;
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://socket.haremaltin.com/socket.io/?EIO=4&transport=websocket'),
  );
  late Currencies _data;

  @override
  void initState() {
    super.initState();
    email = widget.email;

    _channel.stream.listen((event) {
      if (event.toString().startsWith('0')) {
        _channel.sink.add('40');
      } else if (event.toString().startsWith('42')) {
        final parsedData = jsonDecode(event.substring(2));
        Currencies currencies = Currencies.fromJson(parsedData[1]['data']);
        setState(() {
          _data = currencies;
        });
        _channel.sink.add('40');
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
      body: _data.currencies.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _data.currencies.length ?? 0,
        itemBuilder: (context, index) {
          final item = _data.currencies[index];
          if (item == null) {
            return const SizedBox(); // If item is null, skip rendering
          }
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(item!.code),
              subtitle: Text('Alış: ${item.alis}, Satış: ${item.satis}'),
              trailing: Text('Kapanış: ${item.kapanis}'),
            ),
          );
        },
      ),
      /*Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('hello').tr(namedArgs: {'name': email}),
            ],
          ),
          EmptySize.large,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonField(
                buttonText: 'logout'.tr(),
                icon: Icons.logout_outlined,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),*/
    );
  }
}
