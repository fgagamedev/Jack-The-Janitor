# Directories
include_directories(${Jack_SOURCE_DIR}/include ${SYSTEM_LIB_DIR}/SDL-1.2/include)
link_directories(${SYSTEM_LIB_DIR}/SDL-1.2/lib)

# Game library and executable
add_library(JackLib box.cpp enemy.cpp game.cpp gameobject.cpp gameoverscreen.cpp initscreen.cpp jack.cpp label.cpp level.cpp optionsscreen.cpp pausescreen.cpp rawimage.cpp resourcesmanager.cpp scorescreen.cpp sdlutil.cpp timer.cpp)
add_executable(Jack_the_Janitor main.cpp)
target_link_libraries(Jack_the_Janitor JackLib ${SYSTEM_LIBRARIES})

# Install files and directories
install(TARGETS Jack_the_Janitor DESTINATION jtj/bin)
install(PROGRAMS ${SYSTEM_DIR}/JackTheJanitor DESTINATION .)
install(DIRECTORY ${SYSTEM_BIN_DIR}/lib/ DESTINATION jtj/lib)
install(DIRECTORY ${ROOT_DIR}/resources DESTINATION jtj/)
