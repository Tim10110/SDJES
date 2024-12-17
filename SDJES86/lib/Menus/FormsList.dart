import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/Forms/SansH.dart';
import 'package:flutter_application_2/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:docx_template/docx_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Forms/FormEditPage.dart';
import 'package:flutter_application_2/Menus/Home.dart';
import 'package:flutter_application_2/DB/Db_manager.dart';
import 'package:flutter_application_2/objectbox/controller.dart';
import 'package:flutter_application_2/objectbox_core.dart' as objectbox;
import 'package:permission_handler/permission_handler.dart';
import 'package:reflectable/capability.dart';
import 'package:reflectable/mirrors.dart';
import 'package:uuid/uuid.dart';
import 'package:reflectable/reflectable.dart' as r;

class Data extends StatefulWidget {
  const Data({super.key});
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  List<Map<String, dynamic>> displaySH = [];
  List<Map<String, dynamic>> displayAH = [];
  List<Map<String, dynamic>> displayScout = [];
  List<objectbox.SansHModel> displaySHModel = [];
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    //_querySH();
    //_queryAH();
    _retrieveSH();
  }

  void exportData() async {
    if(selectedIndex == -1) {
      return;
    }

    bool permissionIsGranted = false;
    Permission permission = Permission.storage;
    if(Platform.isAndroid){
      // Android needs permisssion
      permissionIsGranted = await permission!.isGranted;
      if(!permissionIsGranted){
        await permission.request();
        permissionIsGranted = await permission.isGranted;
      }
    } else if (Platform.isWindows) {
      // Windows doesn't need permission
      permissionIsGranted = true;
    }

    if(!permissionIsGranted) {
      print('Permission not granted');
      return;
    }

    objectbox.SansHModel sansHData = displaySHModel[selectedIndex];
    // Action à effectuer lorsque le bouton Exporter est cliqué

    final data = await rootBundle.load('assets/docx/final_docx.docx');
    final bytes = data.buffer.asUint8List();

    List<objectbox.ActiviteData> activiteData = (objectBox.retrieveActivite()).where((e) => e.formSHID == sansHData.formSHId).toList();
    final docx = await DocxTemplate.fromBytes(bytes);
    Content c = Content();
    
    InstanceMirror aMirror = reflector.reflect(sansHData);
    List<String> keys = aMirror.type.declarations.keys.toList();
    keys.remove(aMirror.type.simpleName);
    keys.remove('signatureAuthoriteJSON'); //We don't need this in Word file. This is only needed to store the signature data in JSON for modifying form
    keys.remove('signature'); //We add this image to Word file separately

    List<String> values = List.generate(keys.length, (i) => aMirror.invokeGetter(keys[i]).toString());
    for(int x = 0; x < keys.length; x++) {
      c.add(TextContent(keys[x], values[x]));
    }
      
    for(int j = 0; j < activiteData.length; j++) {
      InstanceMirror bMirror = reflector.reflect(activiteData[j]);
      List<String> keys = bMirror.type.declarations.keys.toList();
      keys.remove(bMirror.type.simpleName);
      List<String> values = List.generate(keys.length, (i) => (bMirror.invokeGetter(keys[i])).toString());
      for(int x = 0; x < keys.length; x++) {
        c.add(TextContent('${keys[x]}_$j', values[x].toString()));
      }
    }
    c.add(ImageContent('signature', aMirror.invokeGetter('signature') as Uint8List));
    
    final d = await docx.generate(c);
    String dirPath = Platform.isWindows ? '${(await getApplicationDocumentsDirectory()).path}/SDJES86' : '/storage/emulated/0/Documents/SDJES86';
    Directory directory = await Directory(dirPath).create(recursive: true);
    final filepath = '${directory.path}/visite_par_${sansHData.visiteRealiseePar}_le_${sansHData.dateVisite.day}-${sansHData.dateVisite.month}-${sansHData.dateVisite.year}.docx';
    final file = File(filepath);
    file.createSync();
    if (d != null) {
      await file.writeAsBytes(d);
      print('Document ${file.path} generated! and ${file.existsSync()} exists');
      deleteSansHData();
    }
  }

  void deleteSansHData() {
    if(selectedIndex == -1) {
      return;
    }
    // Action à effectuer lorsque le bouton Supprimer est cliqué
    objectBox.removeSansH(displaySHModel[selectedIndex].formSHId);
    objectBox.removeActivite(displaySHModel[selectedIndex].formSHId);
    displaySHModel.removeAt(selectedIndex);
    selectedIndex = -1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'SDJES86',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Sans Hébergement'),
              Tab(text: 'Avec Hébergement'),
              Tab(text: 'Scoutisme'),
            ],
          ),
        ),
        body:  Container(
          color: Colors.grey[300], // Couleur de fond pour les formulaires
          child: TabBarView(
            children: [
              // Contenu pour la catégorie "Sans Hébergement"

              ListView.builder(
                itemCount: displaySHModel.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = displaySHModel[index];
                  return GestureDetector(
                    onTap: () => setState(() => selectedIndex = (selectedIndex == index ? -1 : selectedIndex)),
                    onLongPress: () => setState(() => selectedIndex = (selectedIndex == index ? -1 : index)),
                    child: Card(
                      shape: selectedIndex == index
                      ? RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0))
                      : RoundedRectangleBorder(
                          side: BorderSide(color: Colors.transparent, width: 2.0),
                          borderRadius: BorderRadius.circular(4.0)),
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text('Visite du ${item.dateVisite.day}-${item.dateVisite.month}-${item.dateVisite.year}'), // Adjust this according to your data structure
                        subtitle: Text('réalisée par ${item.visiteRealiseePar} chez ${item.denomination}'), // Adjust this according to your data structure
                        onTap: () => setState(() => selectedIndex = (selectedIndex == index ? -1 : selectedIndex)),
                        onLongPress: () => setState(() => selectedIndex = (selectedIndex == index ? -1 : index)),
                      ),
                    ),
                  );
                },
              ),


              // Contenu pour la catégorie "Avec Hébergement"
              ListView.builder(
                itemCount: displayAH.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = displayAH[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        '${item['adresse']}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => FormEditPage(idDB: item['formSHId']),
                      ),
                      );
                      },
                    ),
                  );
                },
              ),
              // Contenu pour la catégorie "Scoutisme"
              ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        'Formulaire ${index + 11}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                         // _selectedIndex = index + 10;
                        });
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        persistentFooterButtons: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: Colors.grey[200], // Couleur de fond pour la partie tout en bas
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (selectedIndex!=-1) {    // Action à effectuer lorsque le bouton Modifier est cliqué
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SansH(sansHData: displaySHModel[selectedIndex])));
                        setState(() {});
                        }
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text('Modifier'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[300],
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                    SizedBox(width: 15),
                    ElevatedButton.icon(
                      onPressed: deleteSansHData,
                      icon: const Icon(Icons.delete),
                      label: const Text('Supprimer'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[300],
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                    SizedBox(width: 15),
                    ElevatedButton.icon(
                      onPressed: exportData,
                      icon: const Icon(Icons.send),
                      label: const Text('Exporter'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[300],
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
             BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.data_usage),
              label: 'Data',
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Options',
            ),
          ],
          currentIndex: 1,
          selectedItemColor: Colors.blue[400],
          onTap: (int index) {
            switch (index) {
              case 0:
                // Rediriger vers la page Home.dart
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
                break;
              case 1:
                // Rester sur la page Data.dart
                break;
              case 2:
                // Action à effectuer lorsque l'utilisateur sélectionne "Options"
                break;
            }
          },
        ),
      ),
    );
  }

  void _querySH() async {
    final allRowsSH = await DatabaseHelper().queryAllRowsSH();
    print('query all rows:');
    displaySH = allRowsSH;
    setState(() {});
  }

  void _retrieveSH() async {
    final _dataSH = objectBox.retrieveSansH();
    displaySHModel = _dataSH;
    setState(() {});
  }

  void _queryAH() async {
    final allRowsAH = await DatabaseHelper().queryAllRowsAH(); 
    print('query all rows:');
    allRowsAH.forEach(print);
    displayAH = allRowsAH;
    setState(() {});
  }

}
