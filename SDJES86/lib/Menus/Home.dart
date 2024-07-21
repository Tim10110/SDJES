// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_2/Forms/AvecH.dart';
import 'package:flutter_application_2/Menus/FormsList.dart';
import 'package:flutter_application_2/Forms/SansH.dart';
import 'package:flutter_application_2/Forms/Scout.dart';
import 'package:flutter_application_2/objectbox_core.dart' as objectbox;

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SDJES86',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        centerTitle: true, // Centrer le titre de l'app bar
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20), // Espacement entre l'app bar et le carousel
          Center(
            child: Image.asset(
              'assets/Logo.jpg',
              height: 180,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.35,
                     enableInfiniteScroll: false,
                      viewportFraction: 0.6,
                      enlargeCenterPage: true,
                      initialPage: 1,
                    ),
                    items: [
                      buildCarouselItem(context, 'assets/Form.png', 'Nouveau Formulaire Sans hébergement', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SansH(sansHData: objectbox.SansHModel())));
                      }),
                      buildCarouselItem(context, 'assets/AvecH.png', 'Nouveau Formulaire Avec Hébergement', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AvecH()));
                      }),
                      buildCarouselItem(context, 'assets/Scout.png', 'Nouveau Formulaire Scoutisme', () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Scout()));
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Data()));
              break;
            case 2:
              break;
          }
        },
      ),
    );
  }

Widget buildCarouselItem(BuildContext context, String imagePath, String title, VoidCallback? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 10.0, // Augmenter l'effet d'ombre
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

}
