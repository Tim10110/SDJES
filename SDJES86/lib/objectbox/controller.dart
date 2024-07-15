import 'package:flutter_application_2/objectbox.g.dart';
import 'package:flutter_application_2/objectbox_core.dart' as objectbox;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store store;

  Future<void> initialize() async {
    final docsDir = await getApplicationDocumentsDirectory();
    store = await openStore(directory: p.join(docsDir.path, "obx-db"));
  }

  Future<int> storeSansH(objectbox.SansHModel data) async {
    final box = store.box<objectbox.SansHModel>();
    int id = box.put(data);
    return id;
  }

  List<objectbox.SansHModel> retrieveSansH() {
    final draftsBox = store.box<objectbox.SansHModel>();
    return draftsBox.getAll();
  }

  void removeSansH(int id) {
    final draftsBox = store.box<objectbox.SansHModel>();
    draftsBox.remove(id);
  }

  void emptySansH(int id) {
    final draftsBox = store.box<objectbox.SansHModel>();
    draftsBox.removeAll();
  }
}

final objectBox = ObjectBox();