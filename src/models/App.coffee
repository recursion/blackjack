# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'stand', => @dealerPlay()
    @get('playerHand').on 'bust', => @displayResults()
    @get('playerHand').on 'blackjack', => @dealerPlay()

  deal: ->
    #return the cards from player hand to the deck -->>
    @get('playerHand').returnCardsToDeck()
    #return the cards from ther dealer hand to the deck -->>
    @get('dealerHand').returnCardsToDeck()
    #shuffle the deck
    @get('deck').shuffleIt()

    @get('deck').dealPlayer @get('playerHand')
    @get('deck').dealDealer @get('dealerHand')

  dealerPlay: ->
    hand = @get('dealerHand')
    while hand.scores()[0] < 17
      hand.hit()

    @displayResults

  displayResults: ->
    #if player busted - dealer wins

    #if dealer busted - player wins

    #else compare scores
      #tie  or
      #winner


