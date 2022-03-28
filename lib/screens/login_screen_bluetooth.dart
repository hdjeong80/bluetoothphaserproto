import 'package:bluetoothphaser/bluetooth/bluetooth_search.dart';
import 'package:bluetoothphaser/screens/home_screen.dart';
import 'package:bluetoothphaser/screens/search_station_screen.dart';

import '../common_import.dart';

class LoginScreenBluetooth extends StatefulWidget {
  const LoginScreenBluetooth({Key? key}) : super(key: key);

  @override
  State<LoginScreenBluetooth> createState() => _LoginScreenBluetoothState();
}

class _LoginScreenBluetoothState extends State<LoginScreenBluetooth> {
  AppData appData = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    // BluetoothSearch().disconnectAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AppData appData) => Loading(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: kLoginBackgroundColor,
            body: Padding(
              padding: EdgeInsets.only(
                  top: 300.h, bottom: 351.h, left: 758.w, right: 699.w),
              child: Container(
                width: 542.w,
                height: 550.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  border: Border.all(
                    color: kLoginInnerBorderColor,
                    width: 1,
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 52.h,
                      ),
                      logoText(),
                      SizedBox(height: 45.h),
                      idText(),
                      SizedBox(height: 15.h),
                      passwordText(),
                      SizedBox(height: 8.h),
                      Padding(
                        padding: EdgeInsets.only(left: 82.w),
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 24.w,
                                  height: 24.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0X1A000000),
                                    ),
                                  ),
                                ),
                                Material(
                                  type: MaterialType.canvas,
                                  child: InkWell(
                                    onTap: () {
                                      appData.isRememberId =
                                          !appData.isRememberId;
                                      appData.update();
                                    },
                                    child: Container(
                                      width: 13.w,
                                      height: 13.w,
                                      decoration: BoxDecoration(
                                        color: appData.isRememberId
                                            ? Color(0XFF3C5097)
                                            : Color(0xFFFFFFFF),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Color(0X1A000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 15.w),
                            TextButton(
                              onPressed: () {
                                appData.isRememberId = !appData.isRememberId;
                                appData.update();
                              },
                              child: Text(
                                '아이디 기억하기 ',
                                style: GoogleFonts.notoSans(
                                    color: Color(0XFF32403B),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(width: 40.w),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                '비밀번호를 잊어버리셨나요?',
                                style: GoogleFonts.notoSans(
                                    color: Color(0XFF0035F0),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      loginBtn(),
                      SizedBox(
                        height: 16.h,
                      ),
                      createIdBtn(),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }

  Padding passwordText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 76.w),
      child: Container(
        height: 57.h,
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(31.w, 19.h, 90.w, 20.h),
            hintText: '패스워드',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0X1A000000),
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0X1A000000),
                ),
                borderRadius: BorderRadius.circular(15.34.r)),
          ),
        ),
      ),
    );
  }

  Padding idText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 76.w),
      child: Container(
        height: 57.h,
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(31.w, 19.h, 90.w, 20.h),
            hintText: '아이디',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0X1A000000),
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0X1A000000),
                ),
                borderRadius: BorderRadius.circular(15.34.r)),
          ),
        ),
      ),
    );
  }

  Container logoText() {
    return Container(
      width: 326.w,
      height: 48.65.h,
      //color: Colors.grey[350],
      alignment: Alignment.bottomCenter,
      child: Text(
        '로고',
        textAlign: TextAlign.center,
      ),
    );
  }

  Container createIdBtn() {
    return Container(
      width: 264.w,
      height: 61.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.r),
        border: Border.all(
          color: kLoginInnerBorderColor,
          width: 1,
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => kCreateIDBtnColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(23.2.r),
            ),
          ),
        ),
        onPressed: () {},
        child: Text('계정 만들기'),
      ),
    );
  }

  Container loginBtn() {
    return Container(
      width: 264.w,
      height: 61.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.r),
        border: Border.all(
          color: kLoginInnerBorderColor,
          width: 1,
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => kLoginBtnColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(23.2.r),
            ),
          ),
        ),
        onPressed: () {
          Get.to(() => SearchStationScreen());
        },
        child: Text('로그인'),
      ),
    );
  }
}
