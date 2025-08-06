import 'package:hive/hive.dart';

part 'index.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String title;

  Task({required this.title});
}

// dev_dependencies:
//   flutter_test:
//     sdk: flutter
//   build_runner: ^2.4.9
//   hive_generator: ^2.0.1