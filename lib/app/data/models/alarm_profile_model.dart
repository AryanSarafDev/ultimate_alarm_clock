import 'package:isar/isar.dart';
part 'alarm_profile_model.g.dart';

@collection
class AlarmProfileModel {
  AlarmProfileModel({required this.profileName});

  Id isarId = Isar.autoIncrement;
  late String profileName;
}
