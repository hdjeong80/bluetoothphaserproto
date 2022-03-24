import '../../common_import.dart';

class OnBoarding4 extends StatefulWidget {
  @override
  _OnBoarding4State createState() => _OnBoarding4State();
}

class _OnBoarding4State extends State<OnBoarding4> {
  AppData appData = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AppData appData) => Loading(
        child: Scaffold(
          body: Container(
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
    );
  }
}
