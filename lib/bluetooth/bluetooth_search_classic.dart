import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:bluetoothphaser/bluetooth/bluetooth_message_handler.dart';
import 'package:bluetoothphaser/common_import.dart';
import 'package:bluetoothphaser/data/app_data.dart';
import 'package:bluetoothphaser/screens/common/global_popup.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

BluetoothSearchClassic bluetoothSearchClassic = BluetoothSearchClassic();

class BluetoothSearchClassic {
  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  List<BluetoothDiscoveryResult> results =
      List<BluetoothDiscoveryResult>.empty(growable: true);
  Stream<List<BluetoothDiscoveryResult>>? resultsStream;
  StreamController<List<BluetoothDiscoveryResult>>? streamController;
  bool isDiscovering = false;
  BluetoothConnection? connection;

  void startDiscovery() {
    streamController = StreamController<List<BluetoothDiscoveryResult>>();
    resultsStream = streamController!.stream;

    _streamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      final existingIndex = results
          .indexWhere((element) => element.device.address == r.device.address);
      if (existingIndex >= 0) {
        results[existingIndex] = r;
        streamController!.sink.add(results);
      } else {
        results.add(r);
        streamController!.sink.add(results);
      }
    });

    _streamSubscription!.onDone(() {
      isDiscovering = false;
    });
  }

  void disposeDiscovery() {
    _streamSubscription?.cancel();
  }

  Future<String?> connect(BluetoothDiscoveryResult selectedDevice) async {
    final device = selectedDevice.device;
    final address = device.address;
    try {
      // bool bonded = false;
      // if (device.isBonded) {
      //   print('Unbonding from ${device.address}...');
      //   await FlutterBluetoothSerial.instance
      //       .removeDeviceBondWithAddress(address);
      //   print('Unbonding from ${device.address} has succed');
      //   return '이미 연결된 기기를 강제로 해지했습니다. 다시 연결해주세요.';
      // }
      // print('Bonding with ${device.address}...');
      // bonded =
      //     (await FlutterBluetoothSerial.instance.bondDeviceAtAddress(address))!;
      // print(
      //     'Bonding with ${device.address} has ${bonded ? 'succed' : 'failed'}.');
      connection = await BluetoothConnection.toAddress(address);
      
      print('Connected to the device');

      connection!.input?.listen((Uint8List data) {
        bluetoothMessageHandler.handleReceiveMessage(data);
      }).onDone(() {
        log('Disconnected by remote request');
      });

      return null;
    } catch (e) {
      return '연결에 실패했습니다.';
    }
  }
}
