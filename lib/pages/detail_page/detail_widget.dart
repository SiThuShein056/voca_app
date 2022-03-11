// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:voca_app/ob/voca_ob.dart';

class DetailWidget extends StatelessWidget {
  Vocalist vocalist;
  DetailWidget(this.vocalist);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: Text(vocalist.voca!)),
        Expanded(child: Text(vocalist.gram!)),
        Expanded(child: Text(vocalist.myanmar!)),
      ],
    );
  }
}
