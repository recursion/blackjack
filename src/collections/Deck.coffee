class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
   @shuffleIt()

  dealPlayer: (hand) ->
   if hand?
     hand.add [@pop(), @pop()];
   else
     new Hand [@pop(), @pop()], @

  dealDealer: (hand) ->
    if hand?
      hand.add [@pop().flip(), @pop()]
    else
      new Hand [@pop().flip(), @pop()], @, true

  shuffleIt: ->
    @reset()
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)


