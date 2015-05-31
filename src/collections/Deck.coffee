class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
   @shuffleIt()

  newHand: (isDealer) ->
    new Hand [], @, isDealer

  dealPlayer: (hand) ->
   hand.add [@pop(), @pop()];

  dealDealer: (hand) ->
    hand.add [@pop().flip(), @pop()]

  shuffleIt: ->
    @reset()
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)


