#include <iostream>
#include "game.h"

using namespace std;


int main(int argc, char *argv[]) {
    Game game;
    game.init();
    game.loop();
    game.shutdown();

    return 0;
}

