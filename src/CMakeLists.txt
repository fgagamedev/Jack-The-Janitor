include_directories(${Jack_SOURCE_DIR}/include ${Jack_SOURCE_DIR}/libs/SDL-1.2/include ${Jack_SOURCE_DIR}/libs/SDL_image)
link_directories(${Jack_SOURCE_DIR}/libs/SDL-1.2/lib ${Jack_SOURCE_DIR}/libs/FreeType-2.4/lib)

add_library(JackLib box.cpp enemy.cpp game.cpp gameobject.cpp gameoverscreen.cpp initscreen.cpp jack.cpp label.cpp level.cpp optionsscreen.cpp pausescreen.cpp rawimage.cpp resourcesmanager.cpp scorescreen.cpp sdlutil.cpp timer.cpp)

add_executable(Jack_the_Janitor main.cpp)
target_link_libraries(Jack_the_Janitor JackLib libSDL.so libSDL_image.so libSDL_ttf.so)
install(TARGETS Jack_the_Janitor DESTINATION ${Jack_SOURCE_DIR}/bin)
