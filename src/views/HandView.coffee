class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()
#    @collection.on 'stand', => alert 'received stand event'

  # events:
    # "stand": => alert 'received stand event'
  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]


###
window.HandView = (function(superClass) {
  extend(HandView, superClass);

  function HandView() {
    return HandView.__super__.constructor.apply(this, arguments);
  }

  HandView.prototype.className = 'hand';

  HandView.prototype.template = _.template('<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>');

  HandView.prototype.initialize = function() {
    this.collection.on('add remove change', (function(_this) {
      return function() {
        return _this.render();
      };
    })(this));
    return this.render();
  };

  HandView.prototype.render = function() {
    this.$el.children().detach();
    this.$el.html(this.template(this.collection));
    this.$el.append(this.collection.map(function(card) {
      return new CardView({
        model: card
      }).$el;
    }));
    return this.$('.score').text(this.collection.scores()[0]);
  };

  return HandView;

})(Backbone.View);
###
