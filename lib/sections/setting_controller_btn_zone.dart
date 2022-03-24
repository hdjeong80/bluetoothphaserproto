import 'dart:developer';
import 'dart:ui';
import 'package:bluetoothphaser/bluetooth/bluetooth_message_handler.dart';
import 'package:bluetoothphaser/common_import.dart';
import 'package:bluetoothphaser/model/tag_model.dart';
import 'package:bluetoothphaser/screens/common/tag_card.dart';

class SettingControllerBtnZone extends StatefulWidget {
  const SettingControllerBtnZone({Key? key}) : super(key: key);

  @override
  State<SettingControllerBtnZone> createState() =>
      _SettingControllerBtnZoneState();
}

class _SettingControllerBtnZoneState extends State<SettingControllerBtnZone> {
  AppData appData = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AppData appData) {
      return Loading(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            settingClickBtn(),
            SizedBox(
              height: 55.h,
            ),
            AnimatedCrossFade(
                firstChild: movingMenuControllerBtn(),
                secondChild: movingTagControllerBtn(),
                crossFadeState: appData.isSettingButton
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 700))
          ],
        ),
      );
    });
  }

  Container movingMenuControllerBtn() {
    return Container(
        width: 340.w,
        height: 942.h,
        color: kBackgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: 55.h,
            ),
            // searchStationBtn(),
            SizedBox(
              height: 40.h,
            ),
            serialMonitorBtn(),
            SizedBox(
              height: 40.h,
            ),
            logOutBtn(),
          ],
        ));
  }

  Container searchStationBtn() {
    return Container(
      width: 312.w,
      height: 80.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48.2.r),
          color: kClickSearchStationBtnColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(6.w, 6.w),
                blurRadius: 12,
                color: kClickSearchStationBtnShadowColor_p),
            BoxShadow(
                offset: Offset(-6.w, -6.w),
                blurRadius: 10,
                color: kClickSearchStationBtnShadowColor_m)
          ]),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => kClickSearchStationBtnColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48.2.r),
            ),
          ),
        ),
        onPressed: () {
          appData.enterStation();
        },
        child: Center(
          child: Text(
            '스테이션 찾기',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 35.sp,
              color: kClickNumBtnTextColor,
            ),
          ),
        ),
      ),
    );
  }

  Container serialMonitorBtn() {
    return Container(
      width: 312.w,
      height: 80.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48.2.r),
          color: kClickSearchStationBtnColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(6.w, 6.w),
                blurRadius: 12.r,
                color: kClickSearchStationBtnShadowColor_p),
            BoxShadow(
                offset: Offset(-6.w, -6.w),
                blurRadius: 10.r,
                color: kClickSearchStationBtnShadowColor_m)
          ]),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => kClickSearchStationBtnColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48.2.r),
            ),
          ),
        ),
        onPressed: () {
          appData.enterSerialMoniter();
        },
        child: Center(
          child: Text(
            '시리얼 모니터',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 35.sp,
              color: kClickNumBtnTextColor,
            ),
          ),
        ),
      ),
    );
  }

  Container logOutBtn() {
    return Container(
      width: 312.w,
      height: 80.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48.2.r),
          color: kClickSearchStationBtnColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(6.w, 6.w),
                blurRadius: 12.r,
                color: kClickSearchStationBtnShadowColor_p),
            BoxShadow(
                offset: Offset(-6.w, -6.w),
                blurRadius: 10.r,
                color: kClickSearchStationBtnShadowColor_m)
          ]),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => kClickSearchStationBtnColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48.2.r),
            ),
          ),
        ),
        onPressed: () {
          appData.isClickedLogOutBtn = !appData.isClickedLogOutBtn;
          Get.offAll(() => LoginScreenBluetooth());
          setState(() {});
        },
        child: Center(
          child: Text(
            '로그아웃',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 35.sp,
              color: kClickNumBtnTextColor,
            ),
          ),
        ),
      ),
    );
  }

  Container movingTagControllerBtn() {
    return Container(
      width: 340.w,
      height: 942.h,
      color: kBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          movingTagViewBtn(),
          SizedBox(
            height: 20.h,
          ),
          // clickTagviewBtn(),
          TagCard(tag: appData.selectedTag, hideOutline: true),
          Spacer(),
          showAndClickTagNumberBtn(appData.number),
          // SizedBox(
          //   height: 50.h,
          // ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    clickNumberBtn(1),
                    clickNumberBtn(2),
                    clickNumberBtn(3)
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    clickNumberBtn(4),
                    clickNumberBtn(5),
                    clickNumberBtn(6)
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    clickNumberBtn(7),
                    clickNumberBtn(8),
                    clickNumberBtn(9),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    clickZeroBtn(0),
                    clickDeleteBtn(),
                  ],
                )
              ],
            ),
          )
        ],
      ), //kBackgroundColor
    );
  }

  Widget clickDeleteBtn() {
    return Container(
      width: 96.w,
      height: 96.w,
      child: NeumorphicButton(
        onPressed: () {
          if (appData.typingTagNumber.length > 0) {
            appData.typingTagNumber = appData.typingTagNumber
                .substring(0, appData.typingTagNumber.length - 1);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Center(
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 18,
                  color: kClickNumBtnTextColor,
                ),
              )),
              SizedBox(
                height: 8.h,
              ),
              Text(
                '지움',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: kClickNumBtnTextColor,
                ),
              ),
            ],
          ),
        ),
        style: NeumorphicStyle(
          lightSource: LightSource.topLeft,
          //depth: appData.numStatus[0] ? -5 : 5,
          color: kClickDeleteNumColor,
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(24.2.r)),
        ),
      ),
    );
  }

  // Container clickDeleteBtn() {
  //   return Container(
  //     width: 96.w,
  //     height: 96.w,
  //     child: ElevatedButton(
  //       style: ButtonStyle(
  //         backgroundColor: MaterialStateProperty.resolveWith(
  //             (states) => kClickDeleteNumColor),
  //         shape: MaterialStateProperty.all(
  //           RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(24.2.r),
  //           ),
  //         ),
  //       ),
  //       onPressed: () {},
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Container(
  //               child: Center(
  //             child: Icon(
  //               Icons.arrow_back_rounded,
  //               size: 20,
  //               color: kClickNumBtnTextColor,
  //             ),
  //           )),
  //           SizedBox(
  //             height: 8.h,
  //           ),
  //           Text(
  //             '지움',
  //             textAlign: TextAlign.center,
  //             style: GoogleFonts.montserrat(
  //               fontWeight: FontWeight.w700,
  //               fontSize: 18.sp,
  //               color: kClickNumBtnTextColor,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(24.2.r),
  //       color: kClickDeleteNumColor,
  //       boxShadow: [
  //         BoxShadow(
  //             offset: Offset(6.w, 6.w),
  //             blurRadius: 12.r,
  //             color: kClickDeleteNumshawdowColor_p),
  //         BoxShadow(
  //             offset: Offset(-6.w, -6.w),
  //             blurRadius: 10.r,
  //             color: kSettingNumBtnShadowColor_m)
  //       ],
  //     ),
  //   );
  // }

  Container clickZeroBtn(i) {
    return Container(
      width: 209.w,
      height: 96.w,
      child: NeumorphicButton(
        onPressed: () {
          if (appData.typingTagNumber.length < 2) {
            appData.typingTagNumber += 0.toString();
          }
        },
        child: Center(
          child: Text(
            '${appData.number[i]}',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 35.sp,
              color: kClickNumBtnTextColor,
            ),
          ),
        ),
        style: NeumorphicStyle(
          lightSource: LightSource.topLeft,
          depth: 5,
          color: kClickSearchStationBtnColor,
          shape: NeumorphicShape.convex,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(48.2.r)),
        ),
      ),
    );
  }

  // Container clickZeroBtn() {
  //   return Container(
  //     child: InkWell(
  //       onTap: () {
  //         setState(() {});
  //       },
  //       child: Container(
  //         width: 209.w,
  //         height: 96.w,
  //         alignment: Alignment.center,
  //         child: ElevatedButton(
  //           style: ButtonStyle(
  //             backgroundColor: MaterialStateProperty.resolveWith(
  //                 (states) => kClickSearchStationBtnColor),
  //             shape: MaterialStateProperty.all(
  //               RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(48.2.r),
  //               ),
  //             ),
  //           ),
  //           onPressed: () {},
  //           child: Center(
  //               child: Text(
  //             '0',
  //             style: GoogleFonts.montserrat(
  //               fontWeight: FontWeight.w700,
  //               fontSize: 35.sp,
  //               color: kClickNumBtnTextColor,
  //             ),
  //           )),
  //         ),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(48.2.r),
  //           boxShadow: [
  //             BoxShadow(
  //                 offset: Offset(6.w, 6.w),
  //                 blurRadius: 12.r,
  //                 color: kSettingNumBtnShadowColor_p),
  //             BoxShadow(
  //                 offset: Offset(-6.w, -6.w),
  //                 blurRadius: 10.r,
  //                 color: kSettingNumBtnShadowColor_m)
  //           ],
  //           gradient: LinearGradient(
  //             begin: Alignment.topLeft,
  //             end: Alignment.bottomRight,
  //             tileMode: TileMode.repeated,
  //             colors: [kSettingNumBtnBeginColor, kSettingNumBtnendColor],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Container clickNumberBtn(i) {
    return Container(
      width: 96.w,
      height: 96.w,
      child: NeumorphicButton(
        onPressed: () {
          if (appData.typingTagNumber.length < 2) {
            appData.typingTagNumber += i.toString();
          }
        },
        child: Center(
          child: Text(
            '${appData.number[i]}',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 35.sp,
              color: kClickNumBtnTextColor,
            ),
          ),
        ),
        style: NeumorphicStyle(
          lightSource: LightSource.topLeft,
          depth: 5,
          color: kClickSearchStationBtnColor,
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(48.2.r)),
        ),
      ),
    );
  }

  // Container clickNumberBtn(i) {
  //   return Container(
  //     width: 96.w,
  //     height: 96.w,
  //     alignment: Alignment.center,
  //     child: ElevatedButton(
  //       style: ButtonStyle(
  //         backgroundColor: MaterialStateProperty.resolveWith(
  //             (states) => kClickSearchStationBtnColor),
  //         shape: MaterialStateProperty.all(
  //           RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(48.2.r),
  //           ),
  //         ),
  //       ),
  //       onPressed: () {},
  //       child: Center(
  //           child: Text(
  //         '${number[i]}',
  //         style: GoogleFonts.montserrat(
  //           fontWeight: FontWeight.w700,
  //           fontSize: 35.sp,
  //           color: kClickNumBtnTextColor,
  //         ),
  //       )),
  //     ),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(48.2.r),
  //       boxShadow: [
  //         BoxShadow(
  //             offset: Offset(6.w, 6.w),
  //             blurRadius: 12.r,
  //             color: kSettingNumBtnShadowColor_p),
  //         BoxShadow(
  //             offset: Offset(-6.w, -6.w),
  //             blurRadius: 10.r,
  //             color: kSettingNumBtnShadowColor_m)
  //       ],
  //       gradient: LinearGradient(
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //         tileMode: TileMode.repeated,
  //         colors: [kSettingNumBtnBeginColor, kSettingNumBtnendColor],
  //       ),
  //     ),
  //   );
  // }

  Container showAndClickTagNumberBtn(i) {
    return Container(
        width: 329.w,
        height: 113.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.4.r),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            appData.typingTagNumber,
            textAlign: TextAlign.center,
            style: GoogleFonts.novaRound(
              fontWeight: FontWeight.w700,
              fontSize: 55.sp,
              color: Color(0XA3001F7B),
            ),
          ),
        ));
  }

  // Stack clickTagviewBtn() {
  //   return Stack(
  //     children: [
  //       Container(
  //         width: 200.w,
  //         height: 200.w,
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             border: Border.all(color: Colors.white, width: 5.w),
  //             borderRadius: BorderRadius.circular(36.r),
  //             boxShadow: [
  //               BoxShadow(
  //                 blurRadius: 10.0,
  //                 color: kDeskTagShadowColor,
  //               )
  //             ]),
  //       ),
  //       Material(
  //         type: MaterialType.transparency,
  //         child: InkWell(
  //           borderRadius: BorderRadius.circular(36.r),
  //           child: Container(
  //             width: 200.w,
  //             height: 200.w,
  //             child: Column(
  //               children: [
  //                 SizedBox(
  //                   height: 27.h,
  //                 ),
  //                 appData.selectedTag == null
  //                     ? SizedBox(
  //                         width: 10.w,
  //                         height: 21.h,
  //                       )
  //                     : Image.asset(
  //                         'assets/images/charging_status.png',
  //                         color: appData.isChargingButton == true
  //                             ? null
  //                             : Colors.grey,
  //                         width: 10.w,
  //                         height: 21.h,
  //                       ),
  //                 SizedBox(
  //                   height: 5.h,
  //                 ),
  //                 Image.asset(
  //                   'assets/images/tag_line.png',
  //                   color:
  //                       appData.isChargingButton == true ? null : Colors.grey,
  //                   width: 148.w,
  //                 ),
  //                 Text(
  //                   appData.selectedTag == null
  //                       ? ''
  //                       : appData.selectedTag!.number
  //                           .toString()
  //                           .padLeft(2, '0'),
  //                   //index < 9 ? '0${index + 1}' : '${index + 1}',
  //                   textAlign: TextAlign.center,
  //                   style: GoogleFonts.novaRound(
  //                     fontWeight: FontWeight.w400,
  //                     fontSize: 80.sp,
  //                     color: kDeskTagTextColor,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  Widget movingTagViewBtn() {
    String buttonText = '';
    Color buttonColor = Colors.white;
    Color buttonTextColor = Colors.white;
    TagState stateAfterPushButton = TagState.idle;
    if (appData.selectedTag != null) {
      switch (appData.selectedTag!.tagState) {
        case TagState.idle:
          buttonText = '테이블로 이동';
          buttonColor = Color(0xffFEC5AC);
          buttonTextColor = Color(0xff7E3718);
          stateAfterPushButton = TagState.table;
          break;
        case TagState.charging:
          buttonText = '테이블로 이동';
          buttonColor = Color(0xffFEC5AC);
          buttonTextColor = Color(0xff7E3718);
          stateAfterPushButton = TagState.table;
          break;
        case TagState.table:
          buttonText = '호출하기';
          buttonColor = Color(0xffFEC5AC);
          buttonTextColor = Color(0xff7E3718);
          stateAfterPushButton = TagState.ring;
          break;
        case TagState.ring:
          buttonText = '호출끄기';
          buttonColor = Color(0xffBCC7F8);
          buttonTextColor = Color(0xff3A4E89);
          stateAfterPushButton = TagState.idle;
          break;
      }
    }
    return GestureDetector(
      onTap: () {
        if (appData.selectedTag != null) {
          appData.tags
              .firstWhere(
                  (element) => element.number == appData.selectedTag!.number)
              .tagState = stateAfterPushButton;
          appData.selectedTag!.tagState = stateAfterPushButton;
          appData.update();
          if (stateAfterPushButton == TagState.ring) {
            bluetoothMessageHandler.sendMessage(
                tagNumber: appData.selectedTag!.number, ring: true);
          } else if (stateAfterPushButton == TagState.idle ||
              stateAfterPushButton == TagState.charging) {
            bluetoothMessageHandler.sendMessage(
                tagNumber: appData.selectedTag!.number, ring: false);
          }
        }
      },
      child: Container(
        width: 329.w,
        height: 80.h,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(48.12.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(6.w, 6.h),
                blurRadius: 12.r,
                color: kSettingMoveBtnShadowColor_p,
              ),
              BoxShadow(
                offset: Offset(-6.w, -6.h),
                blurRadius: 10.r,
                color: kSettingMoveBtnShadowColor_m,
              ),
            ]),
        child: Visibility(
          visible: appData.selectedTag != null,
          child: Center(
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: GoogleFonts.novaRound(
                fontWeight: FontWeight.w700,
                fontSize: 35.sp,
                color: buttonTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // NeumorphicButton settingClickBtn() {
  //   return NeumorphicButton(
  //     curve: Curves.easeIn,
  //     duration: Duration(milliseconds: 100),
  //     padding: EdgeInsets.all(5.0),
  //     child: Container(
  //       width: 73.w,
  //       height: 73.w,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(40.r),
  //       ),
  //       child: Stack(
  //         alignment: Alignment.center,
  //         children: [
  //           Container(
  //               width: 40.w,
  //               height: 40.w,
  //               child: Image.asset('assets/images/stroke.png')),
  //           Container(
  //               width: 14.w,
  //               height: 14.w,
  //               child: Image.asset('assets/images/stroke_1.png'))
  //         ],
  //       ),
  //     ),
  //     style: NeumorphicStyle(
  //       color: kSettingBtnColor,
  //       depth: _isSettingButton ? -3 : 5,
  //     ),
  //     onPressed: () {
  //       _isSettingButton = !_isSettingButton;
  //       setState(() {});
  //     },
  //   );
  // }

  Stack settingClickBtn() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.zero,
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.r),
            boxShadow: appData.isSettingButton
                ? null
                : [
                    BoxShadow(
                        offset: Offset(4.31.w, 4.31.w),
                        blurRadius: 15.0.r,
                        color: kSettingBtnShadowColor_p),
                    BoxShadow(
                        offset: Offset(-4.21.w, -4.21.w),
                        blurRadius: 15.0.r,
                        color: kSettingBtnShadowColor_m),
                  ],
          ),
        ),
        Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(21.r),
            child: Container(
              padding: EdgeInsets.zero,
              width: 80.w,
              height: 80.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(21.r)),
              child: Image.asset(appData.isSettingButton
                  ? 'assets/images/setting_select.png'
                  : 'assets/images/setting_normal.png'),
            ),
            onTap: () {
              appData.isSettingButton = !appData.isSettingButton;
              log('${appData.isSettingButton}');
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
