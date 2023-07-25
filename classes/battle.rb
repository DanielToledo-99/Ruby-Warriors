class Battle
  def initialize(player, bot)
    @player = player
    @bot = bot
    @player_char = @player.character
    @bot_char = @bot.character
  end

  def start
    @player_char.prepare_for_battle
    @bot_char.prepare_for_battle

    puts "--------------------"
    puts "#{@player.name} challenges #{@bot.name} to a battle."
    puts "#{@player.name} uses #{@player_char.name}"
    puts "#{@bot.name} uses #{@bot_char.name}"
    puts "--------------------"

    battle_loop

    winner = @player_char.fainted? ? @bot_char : @player_char
    loser = winner == @player_char ? @bot_char : @player_char

    winner.increase_experience(loser)
    puts "#{winner.name} WINS! They experience reached #{winner.experience} points."
  end

  private

  def battle_loop
    until @player_char.fainted? || @bot_char.fainted?
      @player.select_move
      @bot.select_move

      first = select_first(@player_char, @bot_char)
      second = first == @player_char ? @bot_char : @player_char

      puts "--------------------"
      first.attack(second)
      second.attack(first) unless second.fainted?
      puts "--------------------"
    end
  end

  def select_first(player_char, bot_char)
    player_move = player_char.current_move
    bot_move = bot_char.current_move

    return player_char if player_move[:priority] > bot_move[:priority]
    return bot_char if player_move[:priority] < bot_move[:priority]

    if player_char.speed > bot_char.speed
      player_char
    elsif player_char.speed < bot_char.speed
      bot_char
    else
      [player_char, bot_char].sample
    end
  end
end
