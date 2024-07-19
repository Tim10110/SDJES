import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
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

  @override
  void initState() {
    super.initState();
    //_querySH();
    //_queryAH();
    _retrieveSH();
  }

  void exportTemplateData() async {
    final PermissionStatus status;
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if(androidInfo.version.sdkInt <= 32) {
      status = await Permission.storage.request();
    } else {
      status = await Permission.manageExternalStorage.request();
    }
    if (!status.isGranted) {
      print('Permission denied');
      return;
    }
    
    final data = await rootBundle.load('assets/docx/template.docx');
    final bytes = data.buffer.asUint8List();
    final docx = await DocxTemplate.fromBytes(bytes);

    final testFileData = await rootBundle.load('assets/Form.png');
    final testFileContent = testFileData.buffer.asUint8List();

    /*
    final listNormal = ['Foo', 'Bar', 'Baz'];
    final listBold = ['ooF', 'raB', 'zaB'];

    final contentList = <Content>[];

    final b = listBold.iterator;
    for (var n in listNormal) {
      b.moveNext();

      final c = PlainContent("value")
        ..add(TextContent("normal", n))
        ..add(TextContent("bold", b.current));
      contentList.add(c);
    }
    */

    Content c = Content();
    c
      //..add(TextContent("docname", "Simple docname"))
      //..add(TextContent("passport", "Passport NE0323 4456673"))
      ..add(TableContent("table", [
        RowContent()
          ..add(TextContent("key1", "Paul"))
          ..add(TextContent("key2", "Viberg"))
          ..add(TextContent("key3", "Engineer"))
          ..add(ImageContent('img', testFileContent)),
        RowContent()
          ..add(TextContent("key1", "Alex"))
          ..add(TextContent("key2", "Houser"))
          ..add(TextContent("key3", "CEO & Founder"))
          ..add(ListContent("tablelist", [
            TextContent("value", "Mercedes-Benz C-Class S205"),
            TextContent("value", "Lexus LX 570")
          ]))
          ..add(ImageContent('img', testFileContent))
      ]));
      /*
      ..add(ListContent("list", [
        TextContent("value", "Engine")
          ..add(ListContent("listnested", contentList)),
        TextContent("value", "Gearbox"),
        TextContent("value", "Chassis")
      ]))
      ..add(ListContent("plainlist", [
        PlainContent("plainview")
          ..add(TableContent("table", [
            RowContent()
              ..add(TextContent("key1", "Paul"))
              ..add(TextContent("key2", "Viberg"))
              ..add(TextContent("key3", "Engineer")),
            RowContent()
              ..add(TextContent("key1", "Alex"))
              ..add(TextContent("key2", "Houser"))
              ..add(TextContent("key3", "CEO & Founder"))
              ..add(ListContent("tablelist", [
                TextContent("value", "Mercedes-Benz C-Class S205"),
                TextContent("value", "Lexus LX 570")
              ]))
          ])),
        PlainContent("plainview")
          ..add(TableContent("table", [
            RowContent()
              ..add(TextContent("key1", "Nathan"))
              ..add(TextContent("key2", "Anceaux"))
              ..add(TextContent("key3", "Music artist"))
              ..add(ListContent(
                  "tablelist", [TextContent("value", "Peugeot 508")])),
            RowContent()
              ..add(TextContent("key1", "Louis"))
              ..add(TextContent("key2", "Houplain"))
              ..add(TextContent("key3", "Music artist"))
              ..add(ListContent("tablelist", [
                TextContent("value", "Range Rover Velar"),
                TextContent("value", "Lada Vesta SW Sport")
              ]))
          ])),
      ]))
      ..add(ListContent("multilineList", [
        PlainContent("multilinePlain")
          ..add(TextContent('multilineText', 'line 1')),
        PlainContent("multilinePlain")
          ..add(TextContent('multilineText', 'line 2')),
        PlainContent("multilinePlain")
          ..add(TextContent('multilineText', 'line 3'))
      ]))
      ..add(TextContent('multilineText2', 'line 1\nline 2\n line 3'))
      ..add(ImageContent('img', testFileContent));
      */

    final d = await docx.generate(c);
    Directory directory = Directory('/storage/emulated/0/Download');
    await Directory(directory.path).create(recursive: true);
    final filepath = '${directory.path}/generated_${Random().nextInt(1000)}.docx';
    final of = File(filepath);
    of.createSync();
    print(of.existsSync());
    if (d != null) {
      await of.writeAsBytes(d);
      print('Document ${of.path} generated! and ${of.existsSync()} exists');
    }
  }

  void exportData() async {
    /*
    final PermissionStatus status;
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if(androidInfo.version.sdkInt <= 32) {
      status = await Permission.storage.request();
    } else {
      status = await Permission.manageExternalStorage.request();
    }
    if (!status.isGranted) {
      print('Permission denied');
      return;
    }
    */

    List<objectbox.SansHModel> sansHList = objectBox.retrieveSansH();
    final data = await rootBundle.load('assets/docx/final_docx.docx');
    final bytes = data.buffer.asUint8List();

    for(int i = 0; i < sansHList.length; i++) {
      final docx = await DocxTemplate.fromBytes(bytes);
      Content c = Content();
      
      InstanceMirror aMirror = reflector.reflect(sansHList[i]);
      List<String> keys = aMirror.type.declarations.keys.toList();
      keys.remove(aMirror.type.simpleName);
      List<String> values = List.generate(keys.length, (i) => (aMirror.invokeGetter(keys[i])).toString());
      for(int x = 0; x < keys.length; x++) {
        c.add(TextContent(keys[x], /*values[x]*/Random().nextDouble() * 1000000));
      }
      
      final d = await docx.generate(c);
      Directory directory = Directory('C:/Users/joecl/OneDrive/Documents/test'); //Directory('/storage/emulated/0/Download');
      await Directory(directory.path).create(recursive: true);
      final filepath = '${directory.path}/generated_${Random().nextInt(1000)}.docx';
      final of = File(filepath);
      of.createSync();
      print(of.existsSync());
      if (d != null) {
        await of.writeAsBytes(d);
        print('Document ${of.path} generated! and ${of.existsSync()} exists');
      }
    }
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
                    onTap: () {
                      //FormEditPage(idDB: idDB)
                    /*  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormEditPage(avecHData: item),
                        ),
                      );*/
                    },
                    child: Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text('Item ${item.formSHId}'), // Adjust this according to your data structure
                        subtitle: Text(item.directeurNom), // Adjust this according to your data structure
                        onTap: () {
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FormEditPage(idDB: item.formSHId)),
                          );*/
                        },
                      ),
                    ),
                  );
                },
              ),

              /*ListView.builder(
                itemCount: displaySH.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = displaySH[index];
                  return GestureDetector(
                    onTap: () {
                      //FormEditPage(idDB: idDB)
                    /*  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormEditPage(avecHData: item),
                        ),
                      );*/
                    },
                    child: Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(item['nom']), // Adjust this according to your data structure
                        subtitle: Text(item['description']), // Adjust this according to your data structure
                        onTap: () {Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => FormEditPage(idDB: item['formSHId']),
                      ),
                      );
                      },
                      ),
                    ),
                  );
                },
              ),*/

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
                        // Action à effectuer lorsque le bouton Modifier est cliqué
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
                      onPressed: () {
                        // Action à effectuer lorsque le bouton Supprimer est cliqué
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text('Supprimer'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[300],
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                    SizedBox(width: 15),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Action à effectuer lorsque le bouton Exporter est cliqué
                        exportData();
                      },
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
    allRowsSH.forEach(print);
    displaySH = allRowsSH;
    setState(() {});
  }

  void _retrieveSH() async {
    final _dataSH = objectBox.retrieveSansH();
    _dataSH.forEach(print);
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
