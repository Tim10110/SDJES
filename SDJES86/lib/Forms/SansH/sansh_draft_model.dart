// ignore_for_file: overridden_fields

import 'dart:convert';
import 'dart:core';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Forms/SansH.dart';
import 'package:flutter_application_2/objectbox_core.dart' as objectbox;
import 'package:flutter_application_2/objectbox/controller.dart';
import 'package:flutter_application_2/objectbox_core.dart';
import 'package:signature/signature.dart';

class SansHDraftModel {
  List<ActiviteData> activitesSecu = [];
  final prescriptionAuthoritySignatureController = SignatureController();

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
      'dy': o.dy
    };
  }
}
