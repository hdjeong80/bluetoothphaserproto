import 'dart:developer';
import 'dart:ui';
import 'package:bluetoothphaser/bluetooth/bluetooth_search_classic.dart';
import 'package:bluetoothphaser/model/tag_model.dart';
import '../common_import.dart';

// enum TagStatus { charging, standByCharging, waitForGuest, callingGuest }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    bluetoothSearchClassic.connection?.close();
    super.dispose();
  }

  AppData appData = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AppData appData) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 66.04.h, bottom: 47.h, left: 36.w, right: 58.w),
                child: Row(
                  children: [
                    DeskControllerZone(),
                    TableControllerZone(),
                    SizedBox(width: 45.w),
                    SettingControllerBtnZone(),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0.0,
                child: AnimatedOpacity(
                  opacity: appData.isClickedSearchStationBtn ? 1 : 0,
                  duration: Duration(milliseconds: 100),
                  child: IgnorePointer(
                    ignoring: !appData.isClickedSearchStationBtn,
                    child: GestureDetector(
                      onTap: () {
                        appData.enterStation();
                      },
                      child: selectedSearchStation(),
                    ),
                  ),
                )),
            Positioned(
                bottom: 0.0,
                child: AnimatedOpacity(
                  opacity: appData.isClickedSerialMonitorBtn ? 1 : 0,
                  duration: Duration(milliseconds: 100),
                  child: IgnorePointer(
                    ignoring: !appData.isClickedSerialMonitorBtn,
                    child: GestureDetector(
                      onTap: () {
                        appData.enterSerialMoniter();
                      },
                      child: selectedSerialMonitor(),
                    ),
                  ),
                ))
          ],
        ),
      );
    });
  }

  BackdropFilter selectedSearchStation() {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: AnimatedOpacity(
          opacity: appData.isClickedSearchStationBtn ? 1 : 0,
          duration: Duration(milliseconds: 700),
          child: Center(
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
                          appData.exitStation();
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
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: appData.stationTitle.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: appData.isSelectedStation[index]
                                    ? kSearchStationSelectedColor
                                    : null,
                                border: Border.all(
                                    color: kSearchStationListlineColor,
                                    width: 1.w),
                              ),
                              padding: EdgeInsets.only(
                                  left: 16.w, top: 0.h, right: 16.w),
                              child: ListTile(
                                title: Text('${appData.stationTitle[index]}'),
                                subtitle:
                                    Text('${appData.stationSubTitle[index]}'),
                                onTap: () {
                                  appData.isSelectedStation[index] =
                                      !appData.isSelectedStation[index];
                                  log('${appData.isSelectedStation[index]}');
                                  //setState(() {});
                                  appData.update();
                                },
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 65.w, right: 65.w),
                    child: Row(
                      children: [
                        Container(
                          width: 290.w,
                          height: 79.h,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) =>
                                            kSearchStationConnectBtnColor),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(23.r),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                appData.exitStation();
                              },
                              child: Text(
                                '연결하기',
                                style: GoogleFonts.notoSans(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          width: 8.0.w,
                        ),
                        Container(
                          width: 290.w,
                          height: 79.h,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) =>
                                            kSearchStationConnectBtnColor),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(23.r),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                appData.exitStation();
                              },
                              child: Text(
                                '연결 종료',
                                style: GoogleFonts.notoSans(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )),
                        ),
                      ],
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

  BackdropFilter selectedSerialMonitor() {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: AnimatedOpacity(
          opacity: appData.isClickedSerialMonitorBtn ? 1 : 0,
          duration: Duration(milliseconds: 700),
          child: Center(
            child: Container(
              width: 722.w,
              height: 845.h,
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
                          appData.exitSerialMoniter();
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
                        height: 622.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: kSearchStationlineColor, width: 1.53.w),
                          borderRadius: BorderRadius.circular(15.34.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 42.h, horizontal: 42.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '시리얼 모니터',
                                style: GoogleFonts.notoSans(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10.h),
                              Expanded(
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    reverse: true,
                                    child: Text(appData.serialMonitor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 21.h,
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
                          onPressed: () {
                            appData.exitSerialMoniter();
                          },
                          child: Text(
                            '확  인',
                            style: GoogleFonts.notoSans(
                                fontSize: 21.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )),
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
}
