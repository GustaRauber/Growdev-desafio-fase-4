import 'package:fase_4/pages/add_question/add_question.store.dart';
import 'package:fase_4/widgets/custom_input/custom_input.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AddQuestionPage extends StatefulWidget {
  final String deckId;
  const AddQuestionPage({super.key, required this.deckId});

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  final _askController = TextEditingController();
  final _answerController = TextEditingController();
  final _store = AddQuestionStore();

  @override
  void dispose() {
    _askController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  Future<void> _addQuestion() async {
    final ask = _askController.text;
    final answer = _answerController.text;
    if (ask.isNotEmpty && answer.isNotEmpty) {
      final question = await _store.addNewQuestion(
        ask: ask,
        answer: answer,
        deckId: widget.deckId,
      );
      if (!mounted) return;

      Navigator.of(context).pop(question);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo cartão"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomInput(
              controller: _askController,
              label: "Pergunta",
              key: const Key("inputPergunta"),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomInput(
              controller: _answerController,
              label: "Resposta",
              key: const Key("inputResposta"),
              maxLines: 3,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: Observer(
                builder: (context) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: _store.isLoading ? null : _addQuestion,
                    key: const Key("addCardQuestion"),
                    child: _store.isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.black,
                          )
                        : const Text("Adicionar"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
