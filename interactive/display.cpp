/*
Test a simple virtual SDL display, without user input.
*/

#include <cstdlib>
#include <cmath>
#include <iostream>

#include <SDL2/SDL.h>

#define WINDOW_WIDTH 600
#define WINDOW_HEIGHT (WINDOW_WIDTH)
#define N_PIXELS_WIDTH 10
#define N_PIXELS_HEIGHT (N_PIXELS_WIDTH)
#define N_PIXELS (N_PIXELS_WIDTH * N_PIXELS_HEIGHT)
#define PIXEL_WIDTH (WINDOW_WIDTH / N_PIXELS_WIDTH)
#define PIXEL_HEIGHT (WINDOW_HEIGHT / N_PIXELS_HEIGHT)
#define MAX_COLOR 255
#define PI (acos(-1.0))
#define FREQ (0.05)

int main(int argc, char **argv, char **env) {
    SDL_Event event;
    SDL_Rect rect;
    SDL_Renderer *renderer;
    SDL_Window *window;
    int quit;
    double current_time_s;
    unsigned int current_time, last_time;
    unsigned int rs[N_PIXELS];
    unsigned int gs[N_PIXELS];
    unsigned int bs[N_PIXELS];

    quit = 0;

    SDL_Init(SDL_INIT_TIMER | SDL_INIT_VIDEO);
    SDL_CreateWindowAndRenderer(WINDOW_WIDTH, WINDOW_WIDTH, 0, &window, &renderer);
    rect.w = PIXEL_WIDTH;
    rect.h = PIXEL_HEIGHT;
    last_time = SDL_GetTicks();

    while (!quit) {
        while (SDL_PollEvent(&event) == 1) {
            if (event.type == SDL_QUIT) {
                quit = 1;
            }
        }
        current_time = SDL_GetTicks();
        if (current_time != last_time) {
            for (size_t i = 0; i < N_PIXELS_WIDTH; ++i) {
                for (size_t j = 0; j < N_PIXELS_WIDTH; ++j) {
                    size_t cur = j *N_PIXELS_WIDTH + i;
                    current_time_s = current_time / 1000.0;
                    rs[cur] = MAX_COLOR * 0.5 * (1.0 + std::sin((1 + i) * (1 + j) * 1 * 2 * PI * FREQ * current_time_s));
                    gs[cur] = MAX_COLOR * 0.5 * (1.0 + std::sin((1 + i) * (1 + j) * 2 * 2 * PI * FREQ * current_time_s));
                    bs[cur] = MAX_COLOR * 0.5 * (1.0 + std::sin((1 + i) * (1 + j) * 3 * 2 * PI * FREQ * current_time_s));
                }
            }
        }
        for (size_t i = 0; i < N_PIXELS_WIDTH; ++i) {
            for (size_t j = 0; j < N_PIXELS_WIDTH; ++j) {
                size_t cur = j *N_PIXELS_WIDTH + i;
                SDL_SetRenderDrawColor(renderer, rs[cur], gs[cur], bs[cur], 255);
                rect.x = i * PIXEL_WIDTH;
                rect.y = j * PIXEL_HEIGHT;
                SDL_RenderFillRect(renderer, &rect);
            }
        }
        SDL_RenderPresent(renderer);
    }
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
    return EXIT_SUCCESS;
}
