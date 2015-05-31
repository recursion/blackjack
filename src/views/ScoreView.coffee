class window.ScoreView extends Backbone.View

  template: _.template '
      Player Wins: <span class="player-wins"></span
      Dealer Wins: <span class="dealer-win"></span>
      Pushes: <span class="pushes"></span>
    '

  initialize: ->
    @model.on 'change', => @render()
    @render()

  render: ->
    @$el.html @template
    @$('.player-wins').text @model.get 'playerWins'
    @$('.dealer-wins').text @model.get 'dealerWins'
    @$('.pushes').text @model.get 'pushes'
