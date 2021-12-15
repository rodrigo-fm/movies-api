import 'package:flutter/material.dart';

class MensagemErroWidget extends StatelessWidget {
  final String mensagem;
  const MensagemErroWidget(
    this.mensagem, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(mensagem),
    );
  }
}
