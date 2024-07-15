// ignore_for_file: overridden_fields

import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Forms/SansH.dart';
import 'package:flutter_application_2/objectbox_core.dart' as objectbox;
import 'package:flutter_application_2/objectbox/controller.dart';
import 'package:signature/signature.dart';

class SansHModel extends objectbox.SansHModel {
  String totalDeclares = '';
  String totalPresents = '';
  String totalHandi = '';
  String totalAnim = '';
  String totalAnimRequis = '';
  String observationsTempsDePrep = ''; 
  String radioEtape1 = ''; 
  String radioEape2 = ''; 
  String nomPrenomEncadrantACM = ''; 
  String qualifACM = ''; 
  String nomPrenomEncadrantGratuit = '';
  String qualifgratuit = ''; 
  String numeroCartePro = ''; 
  String copyToTest = '';
  List<ActiviteData>? activitesSecu;
  List<Point> signatureAuthorite = [];

  String pointToJSON(Point p) {
    return jsonEncode({
      'offset': offsetToJSON(p.offset),
      'pressure': p.pressure,
      'type': p.type.name
    });
  }

  Map offsetToJSON(Offset o) {
    return {
      'dx': o.dx,
      'dy': o.dy,
      'distance': o.distance,
      'direction': o.direction
    };
  }

  Future<int> insertToDB() async {
    int id = await objectBox.storeSansH(this);
    print(id);
    return id;
  }
}
