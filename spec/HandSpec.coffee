assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'best score', ->
    it 'should return the best possible score of the current hand', ->
      # how can we get specific card from the deck
      # give the hand specific cards and test the return values from
      # bestScore
