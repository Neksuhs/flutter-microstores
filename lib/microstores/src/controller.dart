import 'microstore.dart';

class Controller {
  final Map<String, Microstore> microstores;

  const Controller({required this.microstores});

  // these returns a list of microstores by id
  List<Microstore?> these(List<String> stores) {
    final List<Microstore?> list = [];
    for (var id in stores) {
      list.add(microstores[id]);
    }
    return list;
  }

  // read, reads the state from a single microstore by id
  read(String id) {
    return microstores[id]!.read();
  }
}
