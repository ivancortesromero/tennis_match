class TennisGame
  attr_accessor :player1_points, :player1_sets, :player1_games,
                :player2_points, :player2_sets, :player2_games

  def initialize
    @player1_points = @player2_points = 0
    @player1_games = @player2_games = 0
    @player1_sets = @player2_sets = 0
    @real_points = { 0 => 0, 1 => 15, 2 => 30, 3 => 40, 4 => 'game' }
  end

  def play(points)
    points.each do |point|
      score(point)
      check_game
      check_sets
    end
  end

  def output_score
    "#{@player1_sets + @player2_sets} sets played, #{@player1_games + @player2_games} games played, game score: 1-0; current game: #{current_score}"
  end

  private

  def score(point)
    point.zero? ? @player1_points += 1 : @player2_points +=1
  end

  def check_game
    if @player1_points == 4 and @player1_points + 2 > @player2_points
      @player1_games += 1
      reset_points
    elsif @player2_points == 4 and @player2_points + 2 > @player1_points
      @player2_games +=1
      reset_points
    else
    end
  end
  
  def reset_points
    @player1_points = @player2_points = 0
  end

  def current_score
    return 'Deuce' if deuce?
    return 'Advantage' if advantage?
    "#{real_point(@player1_points)} - #{real_point(@player2_points)}"
  end

  def deuce?
    @player1_points == @player2_games and @player1_games => 3 
  end

  def advantage?
    
  end

  def real_point(point)
    @real_points[point]
  end
end

match = TennisGame.new
match.play([0, 0, 0, 0, 1, 1])
puts match.output_score