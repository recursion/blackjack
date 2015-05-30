assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    app = new App()

  describe 'deal', ->
    it 'should reset the deck', ->
      assert deck.length, 48



