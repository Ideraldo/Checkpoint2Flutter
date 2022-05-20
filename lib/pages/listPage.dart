import 'package:flutter/material.dart';
import 'package:ideraldo_sit/components/ideraldoButton.dart';
import 'package:ideraldo_sit/components/ideraldoCard.dart';
import 'package:ideraldo_sit/components/ideraldoForm.dart';
import 'package:ideraldo_sit/model/musicaModel.dart';
import 'package:ideraldo_sit/pages/standart_playlist_page.dart';

class ListPage extends StatefulWidget {
  //ListPage({required this.startValue});
  @override
  State<StatefulWidget> createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<ListPage> {
  TextEditingController musicNameController = TextEditingController();
  TextEditingController singerController = TextEditingController();
  FocusNode musicNameFocus = FocusNode();
  FocusNode singerFocus = FocusNode();

  List<MusicModel> transactionList = [
    MusicModel(musicName: 'Eu tenho a senha', singer: "João Gomes"),
    MusicModel(musicName: 'Aquelas Coisas', singer: "João Gomes"),
    MusicModel(musicName: 'Proteção de Tela', singer: "Tarcísio do Arcodeon"),
    MusicModel(musicName: 'Ele não te merece', singer: "Whesley Safadão"),
    MusicModel(musicName: 'Vou virar fazendeiro', singer: "Raí Saia Rodada"),
    MusicModel(musicName: 'Eu tenho medo', singer: "Zé Vaqueiro"),
    MusicModel(musicName: 'Será que da certo', singer: "Vitor Fernandes"),
    MusicModel(musicName: 'Filho do mato', singer: "Raí Saia Rodada"),
    MusicModel(musicName: 'Unha de Gel', singer: "Barões da Pisadinha"),
    MusicModel(musicName: 'Meia noite', singer: "Barões da Pisadinha"),
  ];

  addNewMusic({required String? musicName, required String? singer}) {
    setState(() {
      transactionList.insert(
          0, MusicModel(musicName: musicName, singer: singer));
    });
  }

  @override
  Widget build(BuildContext context) {
    return StandardPlaylistPage(
      pageTile: 'Criação de Playlist',
      body: SingleChildScrollView(
        child: Column(
          children: [
            IderaldoForm(
              focusNode: musicNameFocus,
              userInputController: musicNameController,
              label: 'Nome da musica',
              onEditingComplete: () {
                musicNameFocus.nextFocus();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            IderaldoForm(
              focusNode: singerFocus,
              userInputController: singerController,
              label: 'Nome do Artista',
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 15,
                );
              },
              itemCount: transactionList.length,
              itemBuilder: ((context, index) {
                var transactionItem = transactionList[index];
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      print(
                          "Você clicou na música: ${transactionItem.musicName}");
                      //Inserir método de tocar a musica
                    },
                    child: IderaldoCard(
                      text1: transactionItem.musicName,
                      text2: transactionItem.singer,
                    ),
                  ),
                );
              }),
            ),
            IderaldoButton(onPressed: () {
              if (musicNameController.text.isNotEmpty &&
                  singerController.text.isNotEmpty) {
                addNewMusic(
                    musicName: musicNameController.text,
                    singer: singerController.text);
              }
            }),
          ],
        ),
      ),
    );
  }
}
