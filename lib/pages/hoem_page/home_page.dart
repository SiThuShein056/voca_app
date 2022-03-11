// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:voca_app/bloc/voca_bloc.dart';
import 'package:voca_app/ob/response_ob.dart';
import 'package:voca_app/ob/voca_ob.dart';
import 'package:voca_app/pages/detail_page/detail_page.dart';
import 'package:voca_app/pages/hoem_page/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = VocabularyBloc();

  @override
  void initState() {
    super.initState();
    bloc.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vocabulary"),
      ),
      body: StreamBuilder<ResponseOb>(
          initialData: ResponseOb(msgState: MsgStae.loading),
          stream: bloc.getStream(),
          builder: (context, AsyncSnapshot<ResponseOb> snapshot) {
            ResponseOb responseOb = snapshot.data!;

            if (responseOb.msgState == MsgStae.data) {
              List<VocabularyOb> vocalist = responseOb.data;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, indext) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return DetailPage(vocalist[indext]);
                        }));
                      },
                      child: Card(
                        child: HomeWidget(vocalist[indext]),
                      ),
                    );
                  },
                  itemCount: vocalist.length,
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.controller.close();
  }
}
