import 'package:flutter_application_2/objectbox.g.dart';
import 'package:flutter_application_2/objectbox_core.dart' as objectbox;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store sansHStore;
  late final Store activiteStore;

  Future<void> initialize() async {
    final docsDir = await getApplicationDocumentsDirectory();
    sansHStore = await openStore(directory: p.join(docsDir.path, "obx-sansh-db"));
    activiteStore = await openStore(directory: p.join(docsDir.path, "obx-activite-db"));
  }

  Future<int> storeSansH(objectbox.SansHModel data) async {
    final box = sansHStore.box<objectbox.SansHModel>();
    int id = box.put(data);
    return id;
  }

  List<objectbox.SansHModel> retrieveSansH() {
    final draftsBox = sansHStore.box<objectbox.SansHModel>();
    return draftsBox.getAll();
  }

  void removeSansH(int id) {
    final draftsBox = sansHStore.box<objectbox.SansHModel>();
    draftsBox.remove(id);
  }

  void emptySansH() {
    final draftsBox = sansHStore.box<objectbox.SansHModel>();
    draftsBox.removeAll();
  }

  Future<int> storeActivite(objectbox.ActiviteData data) async {
    final box = activiteStore.box<objectbox.ActiviteData>();
    int id = box.put(data);
    return id;
  }

  List<objectbox.ActiviteData> retrieveActivite() {
    final draftsBox = activiteStore.box<objectbox.ActiviteData>();
    return draftsBox.getAll();
  }

  void removeActivite(int id) {
    final draftsBox = sansHStore.box<objectbox.ActiviteData>();
    draftsBox.remove(id);
  }

  void emptyActivite() {
    final draftsBox = activiteStore.box<objectbox.ActiviteData>();
    draftsBox.removeAll();
  }
}

final objectBox = ObjectBox();