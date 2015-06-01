class window.AppView extends Backbone.View
  className: 'container'

  template: _.template '
    <div class="player-hand-container"></div>
    <div class="controls">
      <button class="hit-button">Hit</button>
      <button class="stand-button">Stand</button>
      <button class="deal-button">Deal</button>
    </div>
    <div class="scores-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .deal-button': ->
      # app reset deck
      @model.deal()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('.scores-container').html new ScoreView(model: @model).el
