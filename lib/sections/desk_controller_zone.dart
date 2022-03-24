import 'dart:developer';

import 'package:bluetoothphaser/common_import.dart';
import 'package:bluetoothphaser/model/tag_model.dart';
import 'package:bluetoothphaser/screens/common/tag_card.dart';
import 'package:bluetoothphaser/screens/home_screen.dart';

class DeskControllerZone extends StatefulWidget {
  const DeskControllerZone({Key? key}) : super(key: key);

  @override
  State<DeskControllerZone> createState() => _DeskControllerZoneState();
}

class _DeskControllerZoneState extends State<DeskControllerZone> {
  // bool _isChargingButton = true;
  // bool _isChargingStandByButton = true;
  AppData appData = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AppData appData) {
      return Loading(
        child: Padding(
          padding: EdgeInsets.only(top: 8.5.h),
          child: Material(
            borderRadius: BorderRadius.circular(40.r),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: kDeskControllerColor,
                    offset: Offset(0, 4),
                    blurRadius: 15.0,
                  )
                ],
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.r),
                          topRight: Radius.circular(40.r)),
                      color: kDeskTitleBackgroundColor,
                    ),
                    width: 733.w,
                    height: 107.h,
                    child: Row(
                      children: [
                        deskMonitorIcon(),
                        SizedBox(width: 19.17.w),
                        deskMonitorText(),
                        SizedBox(width: 144.w),
                        chargingStatusBtn(),
                        SizedBox(width: 15.37.w),
                        standByChargeBtn(),
                      ],
                    ),
                  ),
                  DeskStatusController()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  GestureDetector standByChargeBtn() {
    return GestureDetector(
      onTap: () {
      },
      child: Padding(
        padding: EdgeInsets.only(top: 26.0.h, bottom: 27.h),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              false
                  ? 'assets/images/charge_rectangle.png'
                  : 'assets/images/nostatus_rectangle.png',
              width: 152.26.w,
              height: 54.h,
            ),
            chargingStandByButtonText(false)
          ],
        ),
      ),
    );
  }

  GestureDetector chargingStatusBtn() {
    return GestureDetector(
      onTap: () {
      },
      child: Padding(
        padding: EdgeInsets.only(top: 26.0.h, bottom: 27.h),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              false
                  ? 'assets/images/charge_rectangle.png'
                  : 'assets/images/nostatus_rectangle.png',
              width: 152.26.w,
              height: 54.h,
            ),
            chargingButtonText(false)
          ],
        ),
      ),
    );
  }

  Padding deskMonitorText() {
    return Padding(
      padding: EdgeInsets.only(top: 5.0.h),
      child: Container(
        width: 121.w,
        height: 53.h,
        alignment: Alignment.topLeft,
        child: Text(
          '데스크',
          style: GoogleFonts.notoSans(
              fontSize: 35.sp,
              color: kDeskTitleTextColor,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Padding deskMonitorIcon() {
    return Padding(
      padding: EdgeInsets.only(left: 49.17.w, top: 33.17.h, bottom: 32.17.h),
      child: Container(
          width: 41.67.w,
          height: 41.67.w,
          child: Image.asset(
            'assets/images/desk_monitor.png',
          )),
    );
  }
}

class DeskStatusController extends StatefulWidget {
  const DeskStatusController({
    Key? key,
  }) : super(key: key);

  @override
  State<DeskStatusController> createState() => _DeskStatusControllerState();
}

class _DeskStatusControllerState extends State<DeskStatusController> {
  //var value = _isSelectedDeskTag.where((element) => element==false).length;

  AppData appData = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AppData appData) {
      List<TagModel> tagsInDesk = appData.tags
          .where((element) =>
              element.tagState == TagState.idle ||
              element.tagState == TagState.charging)
          .toList();
      tagsInDesk.sort((a, b) => a.number.compareTo(b.number));
      return Container(
        width: 733.w,
        height: 971.h,
        //color: Colors.white,
        decoration: BoxDecoration(
            color: kDeskControllerWhiteColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.r),
                bottomRight: Radius.circular(40.r))),
        child: Padding(
          padding: EdgeInsets.only(top: 15.h, bottom: 35.h),
          child: GridView.builder(
              padding: EdgeInsets.only(
                top: 35.h,
                left: 35.w,
                right: 35.w,
              ),
              itemCount: tagsInDesk.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 43.w,
                crossAxisSpacing: 30.w,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return TagCard(tag: tagsInDesk[index]);
              }),
        ),
      );
    });
  }

  Stack viewTaginDesk(TagModel tag) {
    return Stack(
      children: [
        Container(
          width: 200.w,
          height: 200.w,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: appData.selectedTag?.number == tag.number
                      ? kDeskSelectedTagBorderColor
                      : Colors.white,
                  width: 5.w),
              borderRadius: BorderRadius.circular(36.r),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: kDeskTagShadowColor,
                )
              ]),
        ),
        Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(36.r),
            child: Container(
              width: 200.w,
              height: 200.w,
              child: Column(
                children: [
                  SizedBox(
                    height: 27.h,
                  ),
                  Image.asset(
                    'assets/images/charging_status.png',
                    color: false == true
                        ? null
                        : Color(0XFFC4C4C4),
                    width: 10.w,
                    height: 21.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Image.asset(
                    'assets/images/tag_line.png',
                    color: false == true
                        ? null
                        : Color(0XFFC4C4C4),
                    width: 148.w,
                  ),
                  Text(
                    // index < 9 ? '0${index + 1}' : '${index + 1}',
                    tag.number.toString().padLeft(2, '0'),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.novaRound(
                      fontWeight: FontWeight.w400,
                      fontSize: 80.sp,
                      color: kDeskTagTextColor,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              if (appData.selectedTag?.number == tag.number) {
                appData.selectedTag = null;
              } else {
                appData.selectedTag = tag;
              }
            },
          ),
        )
      ],
    );
  }
}

Padding chargingButtonText(_isChargingButton) {
  return Padding(
    padding: EdgeInsets.only(top: 6.2.h, bottom: 9.74.h),
    child: Text(
      '충전중',
      style: _isChargingButton
          ? GoogleFonts.notoSans(
              color: Colors.white,
              fontSize: 26.56.sp,
              fontWeight: FontWeight.w700,
            )
          : GoogleFonts.notoSans(
              color: kDeskTitleTextColor,
              fontSize: 26.56.sp,
              fontWeight: FontWeight.w700,
            ),
      textAlign: TextAlign.center,
    ),
  );
}

Padding chargingStandByButtonText(_isChargingStandByButton) {
  return Padding(
    padding: EdgeInsets.only(top: 6.2.h, bottom: 9.74.h),
    child: Text(
      '충전대기',
      style: _isChargingStandByButton
          ? GoogleFonts.notoSans(
              color: Colors.white,
              fontSize: 26.56.sp,
              fontWeight: FontWeight.w700,
            )
          : GoogleFonts.notoSans(
              color: kDeskTitleTextColor,
              fontSize: 26.56.sp,
              fontWeight: FontWeight.w700,
            ),
      textAlign: TextAlign.center,
    ),
  );
}
