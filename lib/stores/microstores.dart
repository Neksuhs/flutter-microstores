import '../microstores/microstore.dart';

final counterStore = Microstore<int>(defaultData: 0);
final testStore = Microstore<String>(defaultData: 'testString');

final Map<String, Microstore> allMicrostores = {
  'counterStore': counterStore,
  'testStore': testStore,
};
