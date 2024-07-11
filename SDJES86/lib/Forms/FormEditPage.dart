import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Menus/FormsList.dart';
import 'package:flutter_application_2/Menus/Home.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';
import 'dart:async';
import 'package:flutter_application_2/DB/Db_manager.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class FormEditPage extends StatefulWidget {
  int idDB;

  FormEditPage({required this.idDB});

  @override
  _FormEditPageState createState() => _FormEditPageState();
}

class _FormEditPageState extends State<FormEditPage> {
  final dbSH = DatabaseHelper.instance;
  List<Map<String, dynamic>> monFormSH = [];
  late TextEditingController _capaciteAccueilController;


  int _totalDeclares = 0;
  int _totalPresents = 0;
  int _totalHandi = 0;

  @override
  void initState() {
    super.initState();
    _querySH();
    _capaciteAccueilController = TextEditingController(text: '${monFormSH[widget.idDB]['capAcc']}'); /*
    _moinsDe6AnsDeclaresController = TextEditingController(text: widget.avecHData.moinsDe6AnsDeclares);
    _entre6et13AnsDeclaresController = TextEditingController(text: widget.avecHData.entre6et13AnsDeclares);
    _entre14et17AnsDeclaresController = TextEditingController(text: widget.avecHData.entre14et17AnsDeclares);
    _moinsDe6AnsPresentsController = TextEditingController(text: widget.avecHData.moinsDe6AnsPresents);
    _entre6et13AnsPresentsController = TextEditingController(text: widget.avecHData.entre6et13AnsPresents);
    _entre14et17AnsPresentsController = TextEditingController(text: widget.avecHData.entre14et17AnsPresents);
    _moinsDe6AnsHandiController = TextEditingController(text: widget.avecHData.moinsDe6AnsHandi);
    _entre6et13AnsHandiController = TextEditingController(text: widget.avecHData.entre6et13AnsHandi);
    _entre14et17AnsHandiController = TextEditingController(text: widget.avecHData.entre14et17AnsHandi);
    _totalDeclaresController = TextEditingController(text: widget.avecHData.totalDeclares);
    _totalPresentsController = TextEditingController(text: widget.avecHData.totalPresents);
    _totalHandiController = TextEditingController(text: widget.avecHData.totalHandi);
    _observations2324_13Controller = TextEditingController(text: widget.avecHData.observations2324_13);
    _observations2324_14Controller = TextEditingController(text: widget.avecHData.observations2324_14);
    _observationsRegistreMineursController = TextEditingController(text: widget.avecHData.observationsRegistreMineur);*/
  }

  @override
  void dispose() {
    _capaciteAccueilController.dispose(); /*
    _moinsDe6AnsDeclaresController.dispose();
    _entre6et13AnsDeclaresController.dispose();
    _entre14et17AnsDeclaresController.dispose();
    _moinsDe6AnsPresentsController.dispose();
    _entre6et13AnsPresentsController.dispose();
    _entre14et17AnsPresentsController.dispose();
    _moinsDe6AnsHandiController.dispose();
    _entre6et13AnsHandiController.dispose();
    _entre14et17AnsHandiController.dispose();
    _totalDeclaresController.dispose();
    _totalPresentsController.dispose();
    _totalHandiController.dispose();
    _observations2324_13Controller.dispose();
    _observations2324_14Controller.dispose();
    _observationsRegistreMineursController.dispose();*/
    super.dispose();
  }

/*
  void _saveForm() {
    // Save the modified data
    widget.avecHData.capaciteAccueil = _capaciteAccueilController.text;
    widget.avecHData.moinsDe6AnsDeclares = _moinsDe6AnsDeclaresController.text;
    widget.avecHData.entre6et13AnsDeclares = _entre6et13AnsDeclaresController.text;
    widget.avecHData.entre14et17AnsDeclares = _entre14et17AnsDeclaresController.text;
    widget.avecHData.moinsDe6AnsPresents = _moinsDe6AnsPresentsController.text;
    widget.avecHData.entre6et13AnsPresents = _entre6et13AnsPresentsController.text;
    widget.avecHData.entre14et17AnsPresents = _entre14et17AnsPresentsController.text;
    widget.avecHData.moinsDe6AnsHandi = _moinsDe6AnsHandiController.text;
    widget.avecHData.entre6et13AnsHandi = _entre6et13AnsHandiController.text;
    widget.avecHData.entre14et17AnsHandi = _entre14et17AnsHandiController.text;
    widget.avecHData.totalDeclares = _totalDeclaresController.text;
    widget.avecHData.totalPresents = _totalPresentsController.text;
    widget.avecHData.totalHandi = _totalHandiController.text;
    widget.avecHData.observations2324_13 = _observations2324_13Controller.text;
    widget.avecHData.observations2324_14 = _observations2324_14Controller.text;
    widget.avecHData.observationsRegistreMineur = _observationsRegistreMineursController.text;

    Navigator.pop(context, widget.avecHData); // Return updated data
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier le Formulaire'),
        /*actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],*/
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                labelText: 'N° de déclaration',
                controller: _capaciteAccueilController,
              ),
              const SizedBox(height: 20),
              const Text(
                'Effectifs',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              /*const SizedBox(height: 15),
              const Text('Déclarés sur la fiche complémentaire'),
              const SizedBox(height: 10),
              CustomNumberField(
                labelText: '- de 6 ans',
                controller: _moinsDe6AnsDeclaresController,
                onChanged: (value) {
                  _calculateTotalDeclares();
                },
              ),
              CustomNumberField(
                labelText: '6 - 13 ans',
                controller: _entre6et13AnsDeclaresController,
                onChanged: (value) {
                  _calculateTotalDeclares();
                },
              ),
              CustomNumberField(
                labelText: '14 - 17 ans',
                controller: _entre14et17AnsDeclaresController,
                onChanged: (value) {
                  _calculateTotalDeclares();
                },
              ),
              CustomNumberField(
                labelText: 'Total',
                controller: _totalDeclaresController,
                enabled: false,
              ),
              const SizedBox(height: 10),
              const Text('Présents le jour de l\'inspection'),
              const SizedBox(height: 10),
              CustomNumberField(
                labelText: '- de 6 ans',
                controller: _moinsDe6AnsPresentsController,
                onChanged: (value) {
                  _calculateTotalPresents();
                },
              ),
              CustomNumberField(
                labelText: '6 - 13 ans',
                controller: _entre6et13AnsPresentsController,
                onChanged: (value) {
                  _calculateTotalPresents();
                },
              ),
              CustomNumberField(
                labelText: '14 - 17 ans',
                controller: _entre14et17AnsPresentsController,
                onChanged: (value) {
                  _calculateTotalPresents();
                },
              ),
              CustomNumberField(
                labelText: 'Total',
                controller: _totalPresentsController,
                enabled: false,
              ),
              const SizedBox(height: 10),
              const Text('En situation de handicap présents le jour de l\'inspection'),
              const SizedBox(height: 10),
              CustomNumberField(
                labelText: '- de 6 ans',
                controller: _moinsDe6AnsHandiController,
                onChanged: (value) {
                  _calculateTotalHandi();
                },
              ),
              CustomNumberField(
                labelText: '6 - 13 ans',
                controller: _entre6et13AnsHandiController,
                onChanged: (value) {
                  _calculateTotalHandi();
                },
              ),
              CustomNumberField(
                labelText: '14 - 17 ans',
                controller: _entre14et17AnsHandiController,
                onChanged: (value) {
                  _calculateTotalHandi();
                },
              ),
              CustomNumberField(
                labelText: 'Total',
                controller: _totalHandiController,
                enabled: false,
              ),
              const SizedBox(height: 20),
              const Text(
                'Observations',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                labelText: '23-24-13',
                controller: _observations2324_13Controller,
                
              ),
              const SizedBox(height: 10),
              CustomTextField(
                labelText: '23-24-14',
                controller: _observations2324_14Controller,
                
              ),
              const SizedBox(height: 10),
              CustomTextField(
                labelText: 'Registre spécial des mineurs (Date et Visa)',
                controller: _observationsRegistreMineursController,
                
              ),*/
            ],
          ),
        ),
      ),
    );
  }

    void _querySH() async {
    final allRowsSH = await dbSH.queryAllRowsSH();
    monFormSH = allRowsSH;
    setState(() {});
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final int maxLines;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      maxLines: maxLines,
    );
  }
}

class CustomNumberField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool enabled;

  const CustomNumberField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.onChanged,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
      enabled: enabled,
    );
  }
}


