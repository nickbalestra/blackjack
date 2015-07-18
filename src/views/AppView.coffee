class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .new-game' : ->
      @model.initialize(@model.get('deck'))
      @initialize()

  initialize: ->
    @render()
    @model.get('game').on 'gameover', =>
      @$el.find('button').remove()
      @$el.prepend '<button class="new-game">New Deal</button>'

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    console.log @model.get('deck')

###
window.AppView = (function(superClass) {
  extend(AppView, superClass);

  function AppView() {
    return AppView.__super__.constructor.apply(this, arguments);
  }

  AppView.prototype.template = _.template('<button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <div class="player-hand-container"></div> <div class="dealer-hand-container"></div>');

  AppView.prototype.events = {
    'click .hit-button': function() {
      return this.model.get('playerHand').hit();
    },
    'click .stand-button': function() {
      return this.model.get('playerHand').stand();
    }
  };

  AppView.prototype.initialize = function() {
    return this.render();
  };

  AppView.prototype.render = function() {
    this.$el.children().detach();
    this.$el.html(this.template());
    this.$('.player-hand-container').html(new HandView({
      collection: this.model.get('playerHand')
    }).el);
    return this.$('.dealer-hand-container').html(new HandView({
      collection: this.model.get('dealerHand')
    }).el);
  };

  return AppView;

})(Backbone.View);
###
