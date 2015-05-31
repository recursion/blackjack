class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    @standing = false
    @on 'add', => @checkScore()

  checkScore: ->
    @trigger('bust') if @busted()
    setTimeout => @trigger('stand') if @blackJack()

  hit: ->
    if !@standing and !@busted() and !@blackJack()
      @add(@deck.pop())
    @

  hasAce: -> @reduce (memo, card) ->
    memo or 1 is card.get('value')
  , 0

  blackJack: -> @bestScore() == 21

  busted: -> @scores()[0] > 21

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  bestScore: ->
    # if highScore <= 21
    return @scores()[1] if @scores()[1] <= 21
    @scores()[0]

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  returnCardsToDeck: ->
    while @length
      @deck.push(@pop())
    @standing = false

  stand: ->
    if !@standing and !@busted() and !@blackJack()
      @standing = true
      @trigger 'stand'

  reveal: ->
    @at(0).flip() if @isDealer
