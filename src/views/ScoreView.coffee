class window.ScoreView extends Backbone.View

  template: _.template '
      Your Score: <span class="player-wins"></span>
      Dealer\'s Score: <span class="dealer-wins"></span>
    '

  initialize: ->
    @model.on 'change', => @render()
    @render()

  render: ->
    #@$el.children().detach()
    @$el.html @template
    @$('.player-wins').text @model.get 'playerWins'
    @$('.dealer-wins').text @model.get 'dealerWins'
