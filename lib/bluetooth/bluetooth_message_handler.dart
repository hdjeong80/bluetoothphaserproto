import 'dart:convert';
import 'dart:typed_data';
import 'package:bluetoothphaser/bluetooth/bluetooth_search_classic.dart';
import 'package:bluetoothphaser/common_import.dart';
import 'package:bluetoothphaser/model/tag_model.dart';

BluetoothMessageHandler bluetoothMessageHandler = BluetoothMessageHandler();

enum BluetoothCommand {
  moveToTable,
  startRing,
  stopRing,
}

class BluetoothMessageHandler {
  String _buffer = '';

  handleReceiveMessage(Uint8List data) {
    AppData appData = Get.find();
    appData.serialMonitor = appData.serialMonitor + ascii.decode(data);
    _addToBuffer(ascii.decode(data));
  }

  sendMessage({required int tagNumber, required bool ring}) {
    String message = 'BT::VEACHDA::';

    // 1. Turn ON or OFF
    if (ring)
      message += '1';
    else
      message += '0';

    // 2. ID
    message += tagNumber.toString().padLeft(2, '0');

    // 3. finish
    message += '\n\r';

    _send(message);
  }

  _addToBuffer(String? message) {
    if (message != null) _buffer += message;
    _handleBuffer();
  }

  _send(String message) {
    final List<int> codeUnits = message.codeUnits;
    final Uint8List uint8list = Uint8List.fromList(codeUnits);
    bluetoothSearchClassic.connection!.output.add(uint8list);
  }

  _handleBuffer() {
    AppData appData = Get.find();
    if (_buffer.contains('ECHO::VEACHDA::001')) {
      TagModel? tag;
      try {
        tag = appData.tags.firstWhere((element) => element.number == 01);
      } catch (e) {
        tag = TagModel(id: '01', number: 01);
        appData.tags.add(tag);
      }
      // tag.tagState = TagState.idle;
      _buffer.replaceFirstMapped('ECHO::VEACHDA::001', (match) => '');
      appData.update();
    }
  }
}
