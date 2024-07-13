import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/DB/Db_manager.dart';
import 'package:flutter_application_2/Menus/Home.dart';
import 'package:flutter_application_2/components/my_textfields.dart';
import 'package:flutter_application_2/objectbox/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initDatabase();
  await objectBox.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      title: "Bienvenue sur l'application \n                 SDJES86",
      description: "Application en cours de développement",
      showImage: false,
    ),
    OnboardingPageModel(
      title: "Le choix du formulaire",
      description: "Faites défiler sur l'écran les différents choix....",
      imageUrl: "assets/Gif1.gif", // Chemin du GIF à afficher
      showImage: true,
    ),
    OnboardingPageModel(
      title: "Remplir un formulaire facilement",
      description: "Remplir au fur et a mesure, revennir en arière, naviguer et meme signer !",
      imageUrl: "assets/Gif2.gif", // Chemin du GIF à afficher
      showImage: true,
    ),
    OnboardingPageModel(
      title: "Connectez-vous",
      description: "Entrez vos identifiants pour accéder à votre compte.",
      showImage: false,
    ),
  ];

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return index == pages.length - 1
                  ? LoginPage()
                  : OnboardingPage(
                      title: pages[index].title,
                      description: pages[index].description,
                      imageUrl: pages[index].imageUrl,
                      showImage: pages[index].showImage,
                    );
            },
          ),
          const Positioned(
            bottom: 20, // Distance depuis le bas de l'écran
            right: -20, // Distance depuis la droite de l'écran
            child: SwipeHintAnimation(),
          ),
        ],
      ),
    );
  }
}



class SwipeHintAnimation extends StatefulWidget {
  const SwipeHintAnimation({super.key});

  @override
  _SwipeHintAnimationState createState() => _SwipeHintAnimationState();
}

class _SwipeHintAnimationState extends State<SwipeHintAnimation> {
  late bool _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _isVisible = !_isVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 200),
      child: const Padding(
        padding: EdgeInsets.all(20), // Espacement autour de l'icône
        child: Icon(
          Icons.arrow_forward_ios,
          size: 60, // Taille de l'icône augmentée
          color:  Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}


class OnboardingPage extends StatelessWidget {

  final String title;
  final String description;
  final String? imageUrl;
  final bool showImage;

  const OnboardingPage({super.key, 

    required this.title,
    required this.description,
    this.imageUrl,
    required this.showImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showImage && imageUrl != null) // Afficher l'image si spécifié et non null
          Container(
            height: MediaQuery.of(context).size.height * 0.7, // Ajuste la hauteur en fonction de la taille de l'écran
            width: MediaQuery.of(context).size.width, // Utilise toute la largeur disponible
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // Ajoute un cadre arrondi de rayon 20
              color: Colors.white, // Couleur de fond blanche
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Ajoute un cadre arrondi au contenu de l'image
              child: Image.asset(
                imageUrl!,
                fit: BoxFit.cover, // Ajuste l'image pour couvrir tout le conteneur
              ),
            ),
          ),
        const SizedBox(height: 30),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String? imageUrl;
  final bool showImage;

  OnboardingPageModel({
    required this.title,
    required this.description,
    this.imageUrl,
    required this.showImage,
  });
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String loginuser = "popa";
  final String passworduser = "papo";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        const Text(
          "Connectez-vous",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        // username textfield
        LoginTextfield(
          controller: _usernameController,
          hintText: "Identifiant",
          obscureText: false,
        ),

        const SizedBox(height: 10),
        
        // password textfield
        LoginTextfield(
          controller: _passwordController,
          hintText: "Mot de passe",
          obscureText: true,
        ),

        const SizedBox(height: 20),
        
        ElevatedButton(
          onPressed: () {
            _login(context);
          },
          child: const Text("Se connecter"),    
        ),
      ],
    );
  }
  void _login(BuildContext context) {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == loginuser && password == passworduser) {
      // Identifiants corrects
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()));
    } else {
      // Identifiants incorrects
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Erreur'),
            content: const Text('Identifiant ou mot de passe incorrect.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}