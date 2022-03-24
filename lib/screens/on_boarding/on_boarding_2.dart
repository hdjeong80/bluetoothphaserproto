import '../../common_import.dart';

class OnBoarding2 extends StatefulWidget {
  @override
  _OnBoarding2State createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {
  AppData appData = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AppData appData) => Loading(
        child: Scaffold(
          body: Container(
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
    );
  }
}
