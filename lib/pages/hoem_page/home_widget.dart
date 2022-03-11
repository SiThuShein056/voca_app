// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:voca_app/ob/voca_ob.dart';

class HomeWidget extends StatelessWidget {
  VocabularyOb vocabularyOb;
  HomeWidget(this.vocabularyOb);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.asset(vocabularyOb.image!)],
    );
  }
}
