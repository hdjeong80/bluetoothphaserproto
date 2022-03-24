/*

idle or charging -> table -> ring -> idle or charging -> ..

*/
enum TagState {
  idle, // desk
  charging, // desk
  table,
  ring,
}

class TagModel {
  String id;
  int number;
  TagState tagState;
  TagModel({
    required this.id,
    required this.number,
    this.tagState = TagState.idle,
  });
}
