require_relative "../modules/catalog/characters"

class Character
  attr_reader :name, :experience, :moves, :speed
  attr_accessor :current_move

  def initialize(name, type)
    char_details = Catalog::CHARACTERS[type]

    @name = name
    @type = type
    @experience = char_details[:base_exp]
    @max_health = char_details[:base_stats][:hp]
    @speed = char_details[:base_stats][:speed]
    @moves = char_details[:moves]
    @health = nil
    @current_move = nil
  end

  def prepare_for_battle
    @health = @max_health
    @current_move = nil
  end

  def receive_damage(damage)
    @health -= damage
  end

  def fainted?
    # @health <= 0
    !@health.positive?
  end

  def attack(opponent)
    # hit or a miss
    hit = @current_move[:accuracy] >= rand(1..100)
    damage = @current_move[:power]

    puts "#{@name} uses #{@current_move[:name]}"
    if hit
      opponent.receive_damage(damage)
      puts "Hits #{opponent.name} and caused #{damage} damage"
    else
      puts "#{@name} failed to hit #{opponent.name} and didn't cause any damage"
    end
  end

  def increase_experience(defeat_character)
    @experience += defeat_character.experience * 0.2
  end
end

# player = Player.new(...)
# bot = Bot.new

# player_character = player.character # retorna una instancia de Character
# bot_character = bot.character # retorna una instancia de Character

# player_character.attack(bot_character)
# player_character.increase_experience(bot_character)
