import 'dart:async';
import 'dart:convert';

import 'package:voca_app/ob/response_ob.dart';
import 'package:voca_app/ob/voca_ob.dart';
import 'package:voca_app/util/vocabularies.dart';

class VocabularyBloc {
  StreamController<ResponseOb> controller = StreamController<ResponseOb>();
  Stream<ResponseOb> getStream() => controller.stream;

  getData() {
    List<VocabularyOb> volist = [];
    List<dynamic> list = json.decode(vocabularies);

    ResponseOb responseOb = ResponseOb(msgState: MsgStae.loading);
    controller.sink.add(responseOb);

    if (list.isNotEmpty) {
      list.forEach((element) {
        volist.add(VocabularyOb.fromJson(element));
      });
      responseOb.msgState = MsgStae.data;
      responseOb.data = volist;
      controller.sink.add(responseOb);
    }
  }

  dispose() {
    controller.close();
  }
}
