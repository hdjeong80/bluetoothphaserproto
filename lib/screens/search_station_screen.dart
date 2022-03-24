import 'dart:developer';

import 'package:bluetoothphaser/bluetooth/bluetooth_search.dart';
import 'package:bluetoothphaser/bluetooth/bluetooth_search_classic.dart';
import 'package:bluetoothphaser/screens/common/global_popup.dart';
import 'package:bluetoothphaser/screens/home_screen.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../common_import.dart';

class SearchStationScreen extends StatefulWidget {
  SearchStationScreen({Key? key}) : super(key: key);

  @override
  State<SearchStationScreen> createState() => _SearchStationScreenState();
}

class _SearchStationScreenState extends State<SearchStationScreen> {
  AppData appData = Get.find();
  BluetoothDiscoveryResult? _selectedDevice;
  @override
  void initState() {
    super.initState();
    // bluetoothSearch.startScan(timeout: Duration(seconds: 10));
    bluetoothSearchClassic.startDiscovery();
  }

  @override
  void dispose() {
    // bluetoothSearch.stopScan();
    // BluetoothSearch().disconnectAll();
    bluetoothSearchClassic.disposeDiscovery();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AppData appData) => Loading(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: Center(
            child: Container(
              width: 722.w,
              height: 678.h,
              decoration: BoxDecoration(
                border: Border.all(color: kSearchStationlineColor, width: 1.w),
                borderRadius: BorderRadius.circular(40.r),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25.h, right: 35.w),
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          size: 20,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 65.w),
                    child: Container(
                      width: 593.w,
                      height: 454.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: kSearchStationlineColor, width: 1.53.w),
                        borderRadius: BorderRadius.circular(15.34.r),
                      ),
                      // child: StreamBuilder<List<ScanResult>>(
                      child: StreamBuilder<List<BluetoothDiscoveryResult>>(
                        stream: bluetoothSearchClassic.resultsStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) return Container();
                          if (!snapshot.hasData) return Container();
                          List<BluetoothDiscoveryResult>? scans = snapshot.data;
                          if (scans == null) return Container();

                          // List<ScanResult>? scans = snapshot.data;
                          if (scans == null) return Container();
                          scans.removeWhere((e) {
                            if ((e.device.name?.length ?? 0) == 0) {
                              return true;
                            } else {
                              return false;
                            }
                          });
                          return ListView.separated(
                            itemCount: scans.length,
                            separatorBuilder: (context, index) {
                              return Container();
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: _selectedDevice?.device.address ==
                                          scans[index].device.address
                                      ? kSearchStationSelectedColor
                                      : null,
                                  border: Border.all(
                                      color: kSearchStationListlineColor,
                                      width: 1.w),
                                ),
                                child: ListTile(
                                  title: Text('${scans[index].device.name}'),
                                  onTap: () {
                                    _selectedDevice = scans[index];
                                    setState(() {});
                                  },
                                  // onTap: () =>
                                  //     _handleConnect(scans[index].device),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      // child: ListView.builder(
                      //     padding: EdgeInsets.zero,
                      //     itemCount: appData.stationTitle.length,
                      //     itemBuilder: (context, index) {
                      //       return Container(
                      //         decoration: BoxDecoration(
                      //           color: appData.isSelectedStation[index]
                      //               ? kSearchStationSelectedColor
                      //               : null,
                      //           border: Border.all(
                      //               color: kSearchStationListlineColor,
                      //               width: 1.w),
                      //         ),
                      //         padding: EdgeInsets.only(
                      //             left: 16.w, top: 0.h, right: 16.w),
                      //         child: ListTile(
                      //           title: Text('${appData.stationTitle[index]}'),
                      //           subtitle:
                      //               Text('${appData.stationSubTitle[index]}'),
                      //           onTap: () {
                      //             appData.isSelectedStation[index] =
                      //                 !appData.isSelectedStation[index];
                      //             log('${appData.isSelectedStation[index]}');

                      //             setState(() {});
                      //           },
                      //         ),
                      //       );
                      //     }),
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 65.w),
                    child: Container(
                      width: 592.w,
                      height: 79.h,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => kSearchStationConnectBtnColor),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23.r),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            // Get.off(() => HomeScreen());
                            if (_selectedDevice != null) {
                              appData.enterLoading();
                              final error = await bluetoothSearchClassic
                                  .connect(_selectedDevice!);
                              if (error != null) {
                                appData.exitLoading();
                                showCustomToast(error);
                              } else {
                                appData.exitLoading();
                                Get.offAll(HomeScreen());
                              }
                            } else {
                              appData.exitLoading();
                              showCustomToast('디바이스를 선택해주세요.');
                            }
                          },
                          child: Text('연결하기')),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // _handleConnect(BluetoothDevice device) async {
  //   appData.enterLoading();
  //   bool result = await bluetoothSearch.connect(device);
  //   if (result == false) {
  //     log(' 연결을 실패했습니다. 잠시 후 다시 시도해주세요.');
  //   } else {
  //     log('연결이 되었습니다.');
  //   }
  //   appData.exitLoading();
  // }
}
