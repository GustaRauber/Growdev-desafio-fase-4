import 'package:fase_4/models/question.model.dart';
import 'package:fase_4/pages/add_question/add_question.page.dart';
import 'package:fase_4/pages/new_deck/deck_detail/deck_detail.store.dart';
import 'package:flutter/material.dart';

class AddQuestionButton extends StatelessWidget {
  final DeckDetailStore _store;

  const AddQuestionButton({
    Key? key,
    required DeckDetailStore store,
  })  : _store = store,
        super(key: key);

  Future<void> _addQuestion(BuildContext context) async {
    final question = await Navigator.of(context).push<Question>(
      MaterialPageRoute(
        builder: (_) => AddQuestionPage(
          deckId: _store.deck!.id,
        ),
      ),
    );

    if (question != null) {
      _store.addNewQuestion(question);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 250,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: const BorderSide(
            color: Colors.black,
          ),
        ),
        onPressed: () => _addQuestion(context),
        child: const Text(
          "Add Cartão",
          key: Key("addCard"),
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
