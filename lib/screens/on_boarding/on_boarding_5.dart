import '../../common_import.dart';

class OnBoarding5 extends StatefulWidget {
  @override
  _OnBoarding5State createState() => _OnBoarding5State();
}

class _OnBoarding5State extends State<OnBoarding5> {
  AppData appData = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AppData appData) => Loading(
        child: Scaffold(
          body: Container(
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
