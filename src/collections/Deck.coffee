class window.Deck extends Backbone.Collection
  model: Card

  initialize: (placeHolder, numDecks) ->
    @numDecks = numDecks
    @add _([0...(52 * numDecks)]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor( (card / 13) % 4)

    @on 'remove', => if @length < (13 * @numDecks) then @trigger('shuffleCards', @)
  dealPlayer: -> new Hand [@pop(), @pop()], @

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true


###
this.add(_((function() {
  results = [];
  for (i = 0; i < 52; i++){ results.push(i); }
  return results;
}).apply(this)).shuffle().map(function(card) {
  return new Card({
    rank: card % 13,
    suit: Math.floor(card / 13)
  });
}));
###
