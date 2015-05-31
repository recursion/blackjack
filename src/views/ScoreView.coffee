class window.ScoreView extends Backbone.View

  template: _.template '
      <label id="player">Player Wins: 0<span class="player-wins"></span></label>
      <label id="dealer">Dealer Wins: 0<span class="dealer-win"></span></label>
      <label id="pushes">Pushes: <span class="pushes"></span></label>
      <label id="status"></label>
    '

  initialize: ->
    @model.on 'change', => @render()
    @render()

  render: ->
    @$el.html @template
    @$('.player-wins').text @model.get 'playerWins'
    @$('.dealer-wins').text @model.get 'dealerWins'
    @$('.pushes').text @model.get 'pushes'
    @$('#status').html @model.get 'status'
