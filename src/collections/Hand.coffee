class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    if !@busted() and !@blackJack()
      @add(@deck.pop())
      @trigger('bust') if @busted()
      @trigger('blackjack') if @blackJack()
    @

  hasAce: -> @reduce (memo, card) ->
    memo or 1 is card.get('value')
  , 0

  blackJack: -> @scores()[0] == 21

  busted: -> @scores()[0] > 21

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  returnCardsToDeck: ->
    while @length
      @deck.push(@pop())
