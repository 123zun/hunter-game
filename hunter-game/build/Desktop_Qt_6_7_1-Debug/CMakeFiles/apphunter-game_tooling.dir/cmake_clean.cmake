file(REMOVE_RECURSE
  "hunter-game/GameButton.qml"
  "hunter-game/GameScreen.qml"
  "hunter-game/Main.qml"
  "hunter-game/MenuScreen.qml"
  "hunter-game/images/blue_button01.png"
  "hunter-game/images/cc_background.png"
  "hunter-game/images/coin.png"
  "hunter-game/images/yellow_button01.png"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/apphunter-game_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
