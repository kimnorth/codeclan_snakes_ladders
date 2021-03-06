require('minitest/autorun')
require('minitest/rg')
require_relative('../snake.rb')
require_relative('../ladder.rb')
require_relative('../dice.rb')
require_relative('../player.rb')


class TestPlayer < Minitest::Test

def setup()
  
  @snake_array = [  
  @new_snake_1 = Snake.new("Snake1", 17, 7),
  @new_snake_2 = Snake.new("Snake2", 54, 34),
  @new_snake_3 = Snake.new("Snake3", 62, 19),
  @new_snake_4 = Snake.new("Snake4", 64, 60),
  @new_snake_5 = Snake.new("Snake5", 87, 24),
  @new_snake_6 = Snake.new("Snake6", 93, 73),
  @new_snake_7 = Snake.new("Snake7", 95, 75),
  @new_snake_8 = Snake.new("Snake8", 99, 78)
]


  @ladder_array = [
  @new_ladder_1 = Ladder.new("Ladder1", 8, 14),
  @new_ladder_2 = Ladder.new("Ladder2", 9, 30),
  @new_ladder_3 = Ladder.new("Ladder3", 20, 38),
  @new_ladder_4 = Ladder.new("Ladder4", 28, 84),
  @new_ladder_5 = Ladder.new("Ladder5", 40, 59),
  @new_ladder_6 = Ladder.new("Ladder6", 51, 67),
  @new_ladder_7 = Ladder.new("Ladder7", 63, 81),
  @new_ladder_8 = Ladder.new("Ladder8", 71, 91)
]
  @new_player = Player.new("Jeff", @ladder_array, @snake_array)
  @new_player2 = Player.new("Chris", @ladder_array, @snake_array)
  @new_dice = Dice.new()

end

  def test_player_name
    assert_equal("Jeff", @new_player.name)
  end

  def test_player_position
    assert_equal(1, @new_player.player_position)
  end

  def test_add_dice_to_player_position__first_roll
    @new_player.add_dice_to_player_position(@new_dice, @ladder_array, @snake_array)
    array_1_to_7 = [1,2,3,4,5,6,7]
    if array_1_to_7.include?(@new_player.player_position)
      asserted = true
    end
    assert_equal(true, asserted)
  end

  def test_new_player_position
    @new_player.add_dice_to_player_position(@new_dice, @ladder_array, @snake_array)
      expected = @new_player2.player_position
    assert(expected != @new_player.player_position)
  end

  def test_players_goes_up_ladder
    sub_ladder_array = [ 
    new_ladder_a = Ladder.new("Ladder a", 2, 7),
    new_ladder_b = Ladder.new("Ladder b", 3, 34),
    new_ladder_c = Ladder.new("Ladder c", 4, 19),
    new_ladder_d = Ladder.new("Ladder d", 5, 60),
    new_ladder_e = Ladder.new("Ladder e", 6, 24),
    new_ladder_f = Ladder.new("Ladder f", 7, 73),
    ]

    sub_array_of_snakes = [
      new_snake_a = Snake.new("Snake a", 15, 30),
      new_snake_b = Snake.new("Snake b", 58, 34)
]

    @new_player2.add_dice_to_player_position(@new_dice, sub_ladder_array, sub_array_of_snakes)
      test_landing_array = [7,34,19,60,24,73]
      if test_landing_array.include?(@new_player2.player_position)
        asserted = true
      else  
        asserted = false
      end

    assert_equal(asserted, true)
  end

  # def test_win_condition
  #   assert_equal("You win!", @new_player2.add_dice_to_player_position(@new_dice, @ladder_array, @snake_array))
  # end

end