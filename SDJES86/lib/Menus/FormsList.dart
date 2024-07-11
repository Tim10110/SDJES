import 'package:flutter/material.dart';
import 'package:flutter_application_2/Forms/FormEditPage.dart';
import 'package:flutter_application_2/Menus/Home.dart';
import 'package:flutter_application_2/DB/Db_manager.dart';

class Data extends StatefulWidget {
  const Data({super.key});
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {

  final db = DatabaseHelper.instance;

  List<Map<String, dynamic>> displaySH = [];
  List<Map<String, dynamic>> displayAH = [];
  List<Map<String, dynamic>> displayScout = [];

  @override
  void initState() {
    super.initState();
    _querySH();
    _queryAH();
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
            alignment: Alignment.center,
            color: Colors.grey[200], // Couleur de fond pour la partie tout en bas
            child: Row(
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
                ElevatedButton.icon(
                  onPressed: () {
                    // Action à effectuer lorsque le bouton Exporter est cliqué
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
    final allRowsSH = await db.queryAllRowsSH();
    print('query all rows:');
    allRowsSH.forEach(print);
    displaySH = allRowsSH;
    setState(() {});
  }

  void _queryAH() async {
    final allRowsAH = await db.queryAllRowsAH(); 
    print('query all rows:');
    allRowsAH.forEach(print);
    displayAH = allRowsAH;
    setState(() {});
  }

}
