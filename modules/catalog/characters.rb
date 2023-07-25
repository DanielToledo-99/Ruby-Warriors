module Catalog
  CHARACTERS = {
    "warrior" => {
      type: "player",
      base_exp: 50,
      base_stats: { hp: 90, speed: 45 },
      moves: ["sword attack", "sword of death"]
    },
    "magician" => {
      type: "player",
      base_exp: 50,
      base_stats: { hp: 70, speed: 65 },
      moves: ["magic wind", "fire storm"]
    },
    "lockheed" => {
      type: "bot",
      base_exp: 50,
      base_stats: { hp: 45, speed: 50 },
      moves: ["byte", "fire breathing"]
    },
    "drogon" => {
      type: "bot",
      base_exp: 50,
      base_stats: { hp: 90, speed: 60 },
      moves: ["byte", "fire breathing"]
    },
    "godzilla" => {
      type: "bot",
      base_exp: 50,
      base_stats: { hp: 180, speed: 45 },
      moves: ["atomic breath"]
    },
    "smaug" => {
      type: "bot",
      base_exp: 50,
      base_stats: { hp: 200, speed: 65 },
      moves: ["fire breathing", "confussion"]
    }
  }.freeze
end
