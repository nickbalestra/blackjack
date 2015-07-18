class window.Game extends Backbone.Model
  initialize: ->
##reads player score, when player > 21, call stand()



## determines player turn
## keeps record of players
## once all players have had a turn, simulates dealer's turn
## when dealer's hand is over, determines winner of game
  dealer: ->
    ##no idea yet
  DetermineWinner: ->
  ManageDealerTurn: (dealerHand, playerScore) ->
    dealerHand.at(0).flip()

    scoreToBeat = if playerScore < 22
      17
    else
      0

    score = dealerHand.minScore()

    while score < scoreToBeat
      dealerHand.hit()
      score = dealerHand.minScore()

    score = if score > 21
      0
    else
      score

    @trigger('gameover', @)

    if playerScore > 21 or score > playerScore
      alert 'Dealer Wins!'
    else
      alert 'Player Wins!'

  ManagePlayerTurn: (scores) ->
    if scores[0] > 21
      alert 'Player busts, Dealer will now take a turn'
##      @ManageDealerTurn
      @trigger("playerBust", @)





    ###
    if scores[0] > 21
      alert 'Busted!'
    for score in scores
      if score > 21
        alert 'bust'
###
##  for score in scores
##    if score > 21
##      alert('busted')

##  if scores.reduce(memo, score) -> memo or score > 21, 0
 ##   alert 'busted'
###
