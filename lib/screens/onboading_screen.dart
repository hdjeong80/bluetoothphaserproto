import 'login_screen.dart';

import '../common_import.dart';
// ignore: unused_import
import 'on_boarding/on_boarding_1.dart';
// ignore: unused_import
import 'on_boarding/on_boarding_2.dart';
import 'on_boarding/on_boarding_3.dart';
import 'on_boarding/on_boarding_4.dart';
import 'on_boarding/on_boarding_5.dart';

List<Widget> _onBoardings = [
  // OnBoarding1(),
  // OnBoarding2(),
];

List<Widget> _onBoardingsWithIndicator = [
  OnBoarding3(),
  OnBoarding4(),
  OnBoarding5(),
];

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  AppData appData = Get.find();
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AppData appData) => Loading(
        child: Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _page = index;
                  });
                },
                itemCount:
                    _onBoardings.length + _onBoardingsWithIndicator.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index < _onBoardings.length) {
                    return _onBoardings[index];
                  } else {
                    return _onBoardingsWithIndicator[
                        index - _onBoardings.length];
                  }
                },
              ),
              Visibility(
                visible: _page >= _onBoardings.length,
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: Get.height / 20),
                      child: _pageIndicatorsWidget(
                        length: _onBoardingsWithIndicator.length,
                        page: _page - _onBoardings.length,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _isFinalPage(_page),
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: Get.height / 10),
                      child: ElevatedButton(
                        onPressed: () => Get.offAll(() => LoginScreen()),
                        child: Text(
                          'START',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isFinalPage(int page) {
    return page == _onBoardings.length + _onBoardingsWithIndicator.length - 1;
  }

  Widget _pageIndicatorsWidget({required int length, required int page}) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      ...List.generate(
          length,
          (index) => _dot(
                isActive: page == index,
              ))
    ]);
  }

  Widget _dot({required bool isActive, bool hasShadow = false}) {
    return Container(
      height: 10,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        // height: isActive ? 10 : 8.0,
        // width: isActive ? 12 : 8.0,
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          boxShadow: hasShadow
              ? [
                  isActive
                      ? BoxShadow(
                          color: Colors.white,
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                        )
                      : BoxShadow(
                          color: Colors.white.withOpacity(.5),
                        )
                ]
              : null,
          shape: BoxShape.circle,
          color: isActive ? Colors.amber : Colors.white.withOpacity(.5),
        ),
      ),
    );
  }
}
