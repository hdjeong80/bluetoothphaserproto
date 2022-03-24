import 'package:flutter/material.dart';

final int kMyVersion = 0;
final int kMinimumVersionIfError = 9999;

const double kDefaultMargin = 25.0;
const double kDefaultPadding = 25.0;

const kPrimaryColor = Color(0xff3092C3);
const kSecondaryColor = Color(0xff797979);
const kBlack = Color(0xff555555);
const kGrey = Color(0xffcccccc);
const kGreyLight = Color(0xffe2e2e2);
const kBlueCupertino = Color(0xff3092C3);
const kGreyCupertino = Color(0xff717071);

const kBackgroundColor = Color(0xFFF2F4FB);

const kDeskTitleBackgroundColor = Color(0xFFF6F8FF);
const kDeskTitleTextColor = Color(0XFF3046E2);
const kDeskControllerColor = Color(0XFFD2D7E5);
const kDeskControllerWhiteColor = Color(0XFFFFFFFF);

const kTableTitleTextColor = Color(0XFFE76D39);
const kTableNoTextColor = Color(0XFFF86222);
const kTableTitleBackgroundColor = Color(0XFFF7F8FF);
const kTableSelectedTagBorderColor = Color(0XFFF95A15);
const kTableNoStandByGuestTagLineColor = Color(0XFFC4C4C4);

const kDeskNoChargingColor = Color(0XFFF7F8FF);
const kDeskTagShadowColor = Color(0X7FA2A7CD);
const kDeskTagTextColor = Color(0XFF5C70AB);
const kDeskSelectedTagBorderColor = Color(0XFF334CE3);

const kSettingBtnColor = Color(0XFFF1F3F6);
const kSettingBtnShadowColor_p = Color(0X66AEAEC0);
const kSettingBtnShadowColor_m = Color(0XFFFFFFFF);
const kSettingMoveBtnColor = Color(0XFFF2F4FB);
const kSettingMoveBtnShadowColor_p = Color(0X1A030B23);
const kSettingMoveBtnShadowColor_m = Color(0XFFFFFFFF);
const kSettingTagViewBtnColor = Color(0X80A2A7CD);
const kSettingNumBtnBeginColor = Color(0XFFEBEEFC);
const kSettingNumBtnendColor = Color(0XFFF0F3FF);
const kSettingNumBtnShadowColor_p = Color(0X4D3754AA);

const kClickDeleteNumshawdowColor_p = Color(0X803754AA);

const kSettingNumBtnShadowColor_m = Color(0XFFFFFFFF);

const kClickNumBtnTextColor = Color(0XFF3A4E89);
const kClickDeleteNumColor = Color(0XFFD8DCEC);
const kClickSearchStationBtnColor = Color(0XFFEEF2FF);
const kClickSearchStationBtnShadowColor_p = Color(0X4D030B23);
const kClickSearchStationBtnShadowColor_m = Color(0XFFFFFFFF);
const kClickNumBtnPressedColor = Color(0XFFF2F4FB);

const kLoginBackgroundColor = Color(0XFFF2F4FB);
const kLoginInnerBorderColor = Color(0X1A000000);
const kLoginBtnColor = Color(0XFF3C5097);
const kCreateIDBtnColor = Color(0XFF8696CE);

const kSearchStationlineColor = Color(0X1A000000);
const kSearchStationListlineColor = Color(0XFFE5E5E5);
const kSearchStationConnectBtnColor = Color(0XFF3C5097);
const kSearchStationSelectedColor = Color(0XFFDAE2FF);

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
