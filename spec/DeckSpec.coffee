assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit().last()
      assert.strictEqual deck.length, 49

    it 'should get disabled when score is 21 or greater', ->
      while hand.scores()[0] < 21
        hand.hit()
      assert.equal hand.length, hand.hit().length


