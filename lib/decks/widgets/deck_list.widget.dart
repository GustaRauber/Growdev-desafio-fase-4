import 'package:fase_4/decks/decks.store.dart';
import 'package:fase_4/pages/new_deck/deck_detail/deck_detail.page.dart';
import 'package:flutter/material.dart';

class DeckList extends StatelessWidget {
  final DecksStore _store;
  const DeckList({
    super.key,
    required DecksStore store,
  }) : _store = store;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _store.decks.length,
      itemBuilder: (context, index) {
        final deck = _store.decks[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DeckDetailPage(deck: deck),
              ),
            );
          },
          onLongPress: () => _store.removeDeck(deck.id),
          child: Container(
            height: 150,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  deck.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "${deck.questions.length} ${deck.questions.length == 1 ? "cartão" : "cartões"}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
