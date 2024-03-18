import 'package:isar/isar.dart';
part 'alarm_profile_model.g.dart';
@collection
class AlarmProfileModel {
  Id isarId = Isar.autoIncrement;
  late String profileName;
  AlarmProfileModel({required this.profileName});
}
