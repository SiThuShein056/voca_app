// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:voca_app/ob/voca_ob.dart';

import 'detail_widget.dart';

class DetailPage extends StatelessWidget {
  VocabularyOb vocabularyOb;
  DetailPage(this.vocabularyOb);

  FlutterTts flutterTts = FlutterTts();
  Future speak(String voca) async {
    await flutterTts.speak(voca);
    await flutterTts.setPitch(1);
    await flutterTts.setLanguage("en-US");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vocabularyOb.title!),
      ),
      body: ListView.builder(
          itemCount: vocabularyOb.vocalist!.length,
          itemBuilder: (context, indext) {
            return InkWell(
              onTap: () => speak(vocabularyOb.vocalist![indext].voca!),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(indext.toString() + " . "),
                      SizedBox(width: 5),
                      Expanded(
                          child: DetailWidget(vocabularyOb.vocalist![indext])),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
