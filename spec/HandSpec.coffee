assert = chai.assert

createCard =(rank, suit) ->
  new Card
    rank: rank
    suit: suit

describe 'Hand', ->
  deck = null
  hand = null

  beforeEach ->
    #deck = new Deck()
    #hand = deck.dealPlayer()



  describe 'best score', ->
    it 'should return the best possible score of the current hand', ->
      card1 = createCard(1, 0)
      card2 = createCard(0, 1)
      hand = new Hand [card1, card2]
      assert.equal hand.bestScore(), 21
      card1 = createCard(1, 0)
      card2 = createCard(0, 1)
      card3 = createCard(5, 1)
      hand = new Hand [card1, card2, card3]
      assert.equal hand.bestScore(), 16

