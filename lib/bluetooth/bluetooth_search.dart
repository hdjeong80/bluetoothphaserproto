

// BluetoothSearch bluetoothSearch = BluetoothSearch();
//const String uuidDevice = 'EAC5F98E-E1F7-5492-16ED-067FD33ADFD7';
//const String uuidDevice = '00:15:85:14:9C:09';
// const String uuidDevice = '';

// class BluetoothSearch {
  // final FlutterBlue flutterBlue = FlutterBlue.instance;

  // get scanResults => flutterBlue.scanResults;

  // startScan({Duration? timeout}) {
    // flutterBlue.startScan(timeout: timeout);
  // }

  // stopScan() {
    // flutterBlue.stopScan();
  // }

  // Future<bool> connect(BluetoothDevice device) async {
  // return Future.value(false);
  // AppData appData = Get.find();

  // try {
  //   log('step 1');
  //   await device.connect(
  //     autoConnect: false,
  //     timeout: Duration(seconds: 10),
  //   );
  //   log('step 2');

  //   List<BluetoothService> services = await device.discoverServices();
  //   log('step 3');

  //   BluetoothService bluetoothCustomService = services.firstWhere(
  //       (service) => service.uuid.toString().contains(uuidDevice));
  //   log('uuidDevice');

  //   log('step 4');

  //   bluetoothCustomService.characteristics.forEach((c) async {
  //     bool paired = false;
  //     while (paired == false) {
  //       await Future.delayed(Duration(milliseconds: 1000));
  //       try {
  //         if (await c.setNotifyValue(true)) {
  //           log('sucess,${c.uuid}');
  //           paired = true;
  //         }
  //       } catch (e) {
  //         log(e.toString());
  //         log('retry,${c.uuid}');
  //       }
  //     }
  //   });

  //   return true;
  // } catch (e) {
  //   log(e.toString());
  //   return false;
  // }
  // }

  // Future<void> disconnectAll() async {
    // List<BluetoothDevice> devices = await FlutterBlue.instance.connectedDevices;
    // for (BluetoothDevice device in devices) {
    //   await device.disconnect();
    // }
  // }
// }
