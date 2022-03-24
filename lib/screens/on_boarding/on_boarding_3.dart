import '../../common_import.dart';

class OnBoarding3 extends StatefulWidget {
  @override
  _OnBoarding3State createState() => _OnBoarding3State();
}

class _OnBoarding3State extends State<OnBoarding3> {
  AppData appData = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AppData appData) => Loading(
        child: Scaffold(
          body: Container(
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
