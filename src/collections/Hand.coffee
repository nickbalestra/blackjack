class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    @trigger("hit", @)
    #if hand total < 21
    #else hand busted: automatically call stand()

  stand: ->
    @trigger("stand", @)
    #determine score,
    #call next player()  [always dealer for now]

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    bestScore = @minScore()
    aceCount = 0

    while aceCount < @hasAce()
      if bestScore + 10 <= 21 then bestScore += 10
      aceCount++
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [bestScore]


###
window.Hand = (function(superClass) {
  extend(Hand, superClass);

  function Hand() {
    return Hand.__super__.constructor.apply(this, arguments);
  }

  Hand.prototype.model = Card;

  Hand.prototype.initialize = function(array, deck, isDealer) {
    this.deck = deck;
    this.isDealer = isDealer;
  };

  Hand.prototype.hit = function() {
    return this.add(this.deck.pop());
  };

  Hand.prototype.hasAce = function() {
    return this.reduce(function(memo, card) {
      return memo || card.get('value') === 1;
    }, 0);
  };

  Hand.prototype.minScore = function() {
    return this.reduce(function(score, card) {
      return score + (card.get('revealed') ? card.get('value') : 0);
    }, 0);
  };

  Hand.prototype.scores = function() {
    return [this.minScore(), this.minScore() + 10 * this.hasAce()];
  };

  return Hand;

})(Backbone.Collection);
###
