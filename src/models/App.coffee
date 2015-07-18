# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: (cardDeck) ->
  #  @set 'deck', deck = new Deck()
    @set 'deck', cardDeck
    @set 'playerHand', cardDeck.dealPlayer()
    @set 'dealerHand', cardDeck.dealDealer()
    @set 'game', new Game()

    @get('playerHand').on 'hit', => @get('game').ManagePlayerTurn(@get('playerHand').scores())
    @get('playerHand').on 'stand', => @get('game').ManageDealerTurn(@get('dealerHand'), @get('playerHand').minScore())
    @get('game').on 'playerBust', => @get('game').ManageDealerTurn(@get('dealerHand'), @get('playerHand').minScore())
    @get('deck').on 'shuffleCards', => @set 'deck', new Deck(null, 2)


  newGame: ->
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()
    @set 'game', new Game()
###
window.App = (function(superClass) {
  extend(App, superClass);

  function App() {
    return App.__super__.constructor.apply(this, arguments);
  }

  App.prototype.initialize = function() {
    var deck;
    this.set('deck', deck = new Deck());
    this.set('playerHand', deck.dealPlayer());


##    this.set('currentHand', params.currPlayer());

    this.hands.on('changePlayer', function() {
      currentHand = currPlayer.next
    })
web page loads,
prompt for # of users

for(var i =0; i < numUsers; i++){
  this.hands[i] = new Hand();
  this.hands[i].next = Dealer;
}


    return this.set('dealerHand', deck.dealDealer());
  };

  return App;

})(Backbone.Model);
###
