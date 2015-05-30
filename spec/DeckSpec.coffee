assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should create randomly shuffled decks on initialise', ->
      deck1 = new Deck()
      deck2 = new Deck()
      for x in [0...52]
        assert.strictNotEqual deck1.at(x).get('rankName') deck2.at(x).get('rankName')

    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit().last()
      assert.strictEqual deck.length, 49

    it 'should get disabled when score is 21 or greater', ->
      while hand.scores()[0] < 21
        hand.hit()
      assert.equal hand.length, hand.hit().length

  describe 'deal', ->
    it 'should reset the deck', ->
      deck.dealPlayer()
      assert deck.length, 47
      deck.shuffleIt()
      assert deck.length, 52
