import 'package:bluetoothphaser/common_import.dart';
import 'package:bluetoothphaser/model/tag_model.dart';

class TagCard extends StatelessWidget {
  AppData appData = Get.find();
  TagModel? tag;
  bool hideOutline;
  TagCard({Key? key, required this.tag,  this.hideOutline = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? iconColor;
    String iconPath = '';
    Color? lineColor;
    String linePath = '';
    Color? outlineColor;
    if (tag == null) {
      return Container(
        width: 200.w,
        height: 200.w,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 5.w),
            borderRadius: BorderRadius.circular(36.r),
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: kDeskTagShadowColor,
              )
            ]),
      );
    }

    switch (tag!.tagState) {
      case TagState.idle:
        iconColor = Color(0XFFC4C4C4);
        iconPath = 'assets/images/charging_status.png';
        lineColor = Color(0XFFC4C4C4);
        linePath = 'assets/images/tag_line.png';
        outlineColor = Color(0xff3046E2);
        break;
      case TagState.charging:
        iconPath = 'assets/images/charging_status.png';
        linePath = 'assets/images/tag_line.png';
        outlineColor = Color(0xff3046E2);
        break;
      case TagState.table:
        iconColor = Color(0XFFC4C4C4);
        iconPath = 'assets/images/waiting_guest.png';
        lineColor = Color(0XFFC4C4C4);
        linePath = 'assets/images/table_tag_line.png';
        outlineColor = Color(0xffE76D39);
        break;
      case TagState.ring:
        iconPath = 'assets/images/waiting_guest.png';
        linePath = 'assets/images/table_tag_line.png';
        outlineColor = Color(0xffE76D39);
        break;
    }
    if (appData.selectedTag == null) {
      outlineColor = Colors.white;
    } else if (appData.selectedTag?.number != tag!.number) {
      outlineColor = Colors.white;
    } else if (hideOutline){
      outlineColor = Colors.white;
    }

    return Stack(
      children: [
        Container(
          width: 200.w,
          height: 200.w,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: outlineColor, width: 5.w),
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
                    iconPath,
                    color: iconColor,
                    width: tag!.tagState == TagState.table ||
                            tag!.tagState == TagState.ring
                        ? 20.w
                        : 10.w,
                    height: 21.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Image.asset(
                    linePath,
                    color: lineColor,
                    width: 148.w,
                  ),
                  Text(
                    // index < 9 ? '0${index + 1}' : '${index + 1}',
                    tag!.number.toString().padLeft(2, '0'),
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
              if (appData.selectedTag?.number == tag!.number) {
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
