# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.newHand()
    @set 'dealerHand', deck.newHand(true)

    @set 'playerWins', 0
    @set 'dealerWins', 0

    @get('playerHand').on 'stand', => @dealerPlay()
    @get('playerHand').on 'bust', => @displayResults()

  deal: ->
    #return the cards from player hand to the deck -->>
    @get('playerHand').returnCardsToDeck()
    #return the cards from ther dealer hand to the deck -->>
    @get('dealerHand').returnCardsToDeck()
    #shuffle the deck
    @get('deck').shuffleIt()

    @get('deck').dealPlayer @get('playerHand')
    @get('deck').dealDealer @get('dealerHand')

    @get('playerHand').start()

  dealerPlay: ->
    hand = @get('dealerHand')
    hand.reveal()
    while hand.bestScore() < 17
      hand.hit()

    @displayResults()

  displayResults: ->
    player = @get 'playerHand'
    dealer = @get 'dealerHand'

    if player.busted()
      console.log('dealer wins');
      @set 'dealerWins', @get('dealerWins') + 1
    else if dealer.busted()
      console.log('player wins');
      @set 'playerWins', @get('playerWins') + 1
    else if dealer.bestScore() > player.bestScore()
      console.log('dealer wins');
      @set 'dealerWins', @get('dealerWins') + 1
    else if player.bestScore() > dealer.bestScore()
      console.log('player wins');
      @set 'playerWins', @get('playerWins') + 1
    else
      console.log('its a tie');






