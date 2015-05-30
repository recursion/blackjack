# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  deal: ->
    #return the cards from player hand to the deck -->>
    @get('playerHand').returnCardsToDeck()
    #return the cards from ther dealer hand to the deck -->>
    @get('dealerHand').returnCardsToDeck()
    #shuffle the deck
    console.log @get 'deck'

    @get('deck').shuffleIt()
    #this.collection.reset(this.collection.shuffle(), {silent:true});

    console.log @get 'deck'
    @get('deck').dealPlayer @get('playerHand')
    @get('deck').dealDealer @get('dealerHand')
