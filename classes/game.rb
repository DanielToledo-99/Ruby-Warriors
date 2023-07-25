require_relative "../modules/catalog/characters"
require_relative "../modules/get_input"
require_relative "player"
require_relative "character"
require_relative "battle"

class Game
  include GetInput

  def init
    name = get_input("What's your name?")
    character = select_character.downcase
    character_name = get_input("Give your character a name:")

    player = Player.new(name, character, character_name)
    bot = Bot.new

    battle = Battle.new(player, bot)
    battle.start
  end

  private

  def select_character
    characters = Catalog::CHARACTERS.select { |_key, value| value[:type] == "player" }
    valid_characters = characters.keys # ["warrior", "magician"]
    get_with_options("Choose a character:", valid_characters)
  end
end
