require_relative "../modules/get_input"
require_relative "../modules/catalog/moves"
require_relative "character"

class Player
  include GetInput
  attr_reader :character, :name

  def initialize(name, character_type, character_name)
    @name = name
    @character = Character.new(character_name, character_type)
  end

  def select_move
    move = get_with_options("Select a move to attack", @character.moves)
    @character.current_move = Catalog::MOVES[move]
  end
end

class Bot < Player
  def initialize
    bot_characters = Catalog::CHARACTERS.select { |_key, value| value[:type] == "bot" }
    options = bot_characters.keys # resultado => ["lockheed", "drogon", "godzilla", "smaug"]
    select_character = options.sample # resultado => "drogon"

    super("Dragon Master", select_character, select_character.capitalize)
  end

  def select_move
    move = @character.moves.sample
    @character.current_move = Catalog::MOVES[move]
  end
end
