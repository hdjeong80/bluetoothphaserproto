import 'package:bluetoothphaser/model/tag_model.dart';
import 'package:bluetoothphaser/screens/home_screen.dart';
import 'package:get/get.dart';

class AppData extends GetxController {
  String _typingTagNumber = '';

  String get typingTagNumber => _typingTagNumber;

  set typingTagNumber(String typingTagNumber) {
    _typingTagNumber = typingTagNumber;
    try {
      final tag = tags.firstWhere(
          (element) => element.number == int.parse(_typingTagNumber));
      selectedTag = tag;
    } catch (e) {
      selectedTag = null;
    }
    update();
  }

  List<TagModel> tags = [];
  TagModel? _selectedTag;

  TagModel? get selectedTag => _selectedTag;

  set selectedTag(TagModel? selectedTag) {
    _selectedTag = selectedTag;
    update();
  }

  String _serialMonitor = '';

  String get serialMonitor => _serialMonitor;

  set serialMonitor(String serialMonitor) {
    _serialMonitor = serialMonitor;
    update();
  }

  bool _isLoadingScreen = false;

  bool get isLoading => _isLoadingScreen;

  void enterLoading() {
    _isLoadingScreen = true;
    update();
  }

  void exitLoading() {
    _isLoadingScreen = false;
    update();
  }

//
//login screen bluetooth
  bool isRememberId = false;

// Desk

//
//table

  //bool isSelectedTableTag = false;
//
//Setting
  bool isSettingButton = false;
  bool _isClickedSearchStationBtn = false;

  bool get isClickedSearchStationBtn => _isClickedSearchStationBtn;

  void enterStation() {
    _isClickedSearchStationBtn = true;
    update();
  }

  void exitStation() {
    _isClickedSearchStationBtn = false;
    update();
  }

  bool _isClickedSerialMonitorBtn = false;
  bool get isClickedSerialMonitorBtn => _isClickedSerialMonitorBtn;

  void enterSerialMoniter() {
    _isClickedSerialMonitorBtn = true;
    update();
  }

  void exitSerialMoniter() {
    _isClickedSerialMonitorBtn = false;
    update();
  }

  bool isClickedLogOutBtn = false;

  List<String> stationTitle = ['STATION 01', 'STATION 02', 'STATION 03'];
  List<String> stationSubTitle = [
    'AA:BB:CC:DD:EE:FF',
    'AA:23:CC:11:E5:FF',
    '1A:BB:7C:DD:4E:5F'
  ];
  List<bool> isSelectedStation = List.generate(300, (index) => false);

  List<int> number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  List<bool> numStatus = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
}
