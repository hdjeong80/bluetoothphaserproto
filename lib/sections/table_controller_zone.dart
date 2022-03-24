import 'dart:developer';

import 'package:bluetoothphaser/common_import.dart';
import 'package:bluetoothphaser/model/tag_model.dart';
import 'package:bluetoothphaser/screens/common/tag_card.dart';

class TableControllerZone extends StatefulWidget {
  const TableControllerZone({Key? key}) : super(key: key);

  @override
  State<TableControllerZone> createState() => _TableControllerZoneState();
}

class _TableControllerZoneState extends State<TableControllerZone> {
  // bool _isWaitingForGuestButton = false;
  // bool _isCallingGuestButton = false;
  AppData appData = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AppData appData) {
      return Loading(
        child: Padding(
          padding: EdgeInsets.only(left: 44.w, top: 8.5.h),
          child: Material(
            borderRadius: BorderRadius.circular(40.r),
            elevation: 10.0,
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
                      color: kTableTitleBackgroundColor,
                    ),
                    width: 733.w,
                    height: 107.h,
                    child: Row(
                      children: [
                        tableCupIcon(),
                        SizedBox(width: 19.17.w),
                        tableCupText(),
                        SizedBox(width: 144.w),
                        waitingForGuestBtn(),
                        SizedBox(width: 15.37.w),
                        callingGuestBtn(),
                      ],
                    ),
                  ),
                  TableStatusController()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  GestureDetector callingGuestBtn() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(top: 26.0.h, bottom: 27.h),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              false
                  ? 'assets/images/guest_rectangle.png'
                  : 'assets/images/notable_rectangle.png',
              width: 152.26.w,
              height: 54.h,
            ),
            callingGuestButtonText(false)
          ],
        ),
      ),
    );
  }

  GestureDetector waitingForGuestBtn() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(top: 26.0.h, bottom: 27.h),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              true
                  ? 'assets/images/notable_rectangle.png'
                  : 'assets/images/guest_rectangle.png',
              width: 152.26.w,
              height: 54.h,
            ),
            waitingForGuestButtonText(true)
          ],
        ),
      ),
    );
  }

  Padding tableCupText() {
    return Padding(
      padding: EdgeInsets.only(top: 5.0.h),
      child: Container(
        width: 121.w,
        height: 53.h,
        alignment: Alignment.topLeft,
        child: Text(
          '테이블',
          style: GoogleFonts.notoSans(
              fontSize: 35.sp,
              color: kTableTitleTextColor,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Padding tableCupIcon() {
    return Padding(
      padding: EdgeInsets.only(left: 49.17.w, top: 33.17.h, bottom: 32.17.h),
      child: Container(
          width: 41.67.w,
          height: 37.5.w,
          child: Image.asset(
            'assets/images/cup.png',
          )),
    );
  }
}

class TableStatusController extends StatefulWidget {
  const TableStatusController({
    Key? key,
  }) : super(key: key);

  @override
  State<TableStatusController> createState() => _TableStatusControllerState();
}

class _TableStatusControllerState extends State<TableStatusController> {
  // bool _isSelectedTableTag = false;
  // bool _isStandByGuestTag = false;
  // bool _isCallingGuestTag = false;
  //var value = _isSelectedDeskTag.where((element) => element==false).length;
  AppData appData = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AppData appData) {
      List<TagModel> tableTags = appData.tags
          .where((element) =>
              element.tagState == TagState.table ||
              element.tagState == TagState.ring)
          .toList();
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
              itemCount: tableTags.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 43.w,
                crossAxisSpacing: 30.w,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return TagCard(tag: tableTags[index]);
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
                      ? kTableSelectedTagBorderColor
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
                    'assets/images/waiting_guest.png',
                    color: false ? null : kTableNoStandByGuestTagLineColor,
                    width: 20.w,
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Image.asset(
                    'assets/images/table_tag_line.png',
                    color: false
                        ? Color(0XFFF95A15)
                        : kTableNoStandByGuestTagLineColor,
                    width: 148.w,
                  ),
                  Text(
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

Padding waitingForGuestButtonText(_isWaitingForGuestButton) {
  return Padding(
    padding: EdgeInsets.only(top: 6.2.h, bottom: 9.74.h),
    child: Text(
      '손님대기',
      style: _isWaitingForGuestButton
          ? GoogleFonts.notoSans(
              color: kTableNoTextColor,
              fontSize: 26.56.sp,
              fontWeight: FontWeight.w700,
            )
          : GoogleFonts.notoSans(
              color: Colors.white,
              fontSize: 26.56.sp,
              fontWeight: FontWeight.w700,
            ),
      textAlign: TextAlign.center,
    ),
  );
}

Padding callingGuestButtonText(_isCallingGuestButton) {
  return Padding(
    padding: EdgeInsets.only(top: 6.2.h, bottom: 9.74.h),
    child: Text(
      '호출중',
      style: _isCallingGuestButton
          ? GoogleFonts.notoSans(
              color: Colors.white,
              fontSize: 26.56.sp,
              fontWeight: FontWeight.w700,
            )
          : GoogleFonts.notoSans(
              color: kTableNoTextColor,
              fontSize: 26.56.sp,
              fontWeight: FontWeight.w700,
            ),
      textAlign: TextAlign.center,
    ),
  );
}
