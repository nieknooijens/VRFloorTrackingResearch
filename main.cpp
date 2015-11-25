#include <iostream> //for debug prints
#include <SDL2/SDL.h> //because I'm too lazy to write a joystick driver
#include <boost/network/protocol/http/server.hpp> //Because I'm too lazy writing a webserver
#include <string>
#include <sstream>
#include <vector>

namespace http = boost::network::http;
struct handler;
typedef http::server<handler> http_server;

SDL_Joystick* js;

struct point {
	double X = 0;
	double Y = 0;
};

//every time a HTTP_request is done to this server it will enter the response function in this struct.
struct handler {

	std::string lastmessage = "Hello, floorserver here! \n";
	int buttonPressed = 0;
	void operator() (http_server::request const&,
		http_server::response &response) { //read the joystick and return the coordinates!
		//make sure that our coordinate is reset every time:
		SDL_Event event;
		SDL_PollEvent(&event); //update the current joystick state
		int num_buttons = SDL_JoystickNumButtons(js);
		std::vector<point> coordinates;
		for(int i = 0; i< num_buttons; i++) {
			if(SDL_JoystickGetButton(js,i)) {
				point p;
				switch (i) {
					case 0: //(0,1)
						p.X = 0;
						p.Y = 1;
						break;
					case 1: //(1,2)
						p.X = 1;
						p.Y = 2;
						break;
					case 2: //(1,0)
						p.X = 1;
						p.Y = 0;
						break;
					case 3: //(2,1)
						p.X = 2;
						p.Y = 1;
						break;
					case 4: //(0,2)
						p.X = 0;
						p.Y = 2;
						break;
					case 5: //(2,2)
						p.X = 2;
						p.Y = 2;
						break;
					case 6: //(0,0)
						p.X = 0;
						p.Y = 0;
						break;
					case 7: //(2,0)
						p.X = 2;
						p.Y = 0;
						break;
				}
				coordinates.push_back(p);
			}
		}
		std::stringstream message;
		if(coordinates.size() == 0) { } //do nothing
		else { //calculate the average point.
			double X = 0;
			double Y = 0;
			for(unsigned int i=0; i < coordinates.size(); i++) {
				X = X + coordinates[i].X;
				Y = Y + coordinates[i].Y;
			}
			double size = coordinates.size();
			X = X / size;
			Y = Y / size;
			std::cout << "X: " << X << " - Y: " << Y << " - size: " << coordinates.size() << std::endl;
			message << "{" << X << "," << Y << "}" << std::endl;
		}

		lastmessage = message.str();
		response = http_server::response::stock_reply(
				 http_server::response::ok, lastmessage);
	}

	void log(http_server::string_type const &info) {
		std::cerr << "ERROR: " << info << '\n';
	}
};


int main(int, char**){
	SDL_Init(SDL_INIT_JOYSTICK);
	SDL_JoystickEventState(SDL_ENABLE);
	atexit(SDL_Quit);
	int num_joysticks = SDL_NumJoysticks();
	if(num_joysticks == 0) {
		std::cout << "No joysticks found! please attach a device and re-run this program" << std::endl;
		return 0;
	}
		js = SDL_JoystickOpen(0);
			//ok we've found our joystick!
		if (js) {
			SDL_JoystickGUID guid = SDL_JoystickGetGUID(js);
			char guid_str[1024];
			SDL_JoystickGetGUIDString(guid, guid_str, sizeof(guid_str));
			const char* name = SDL_JoystickName(js);

			int num_axes = SDL_JoystickNumAxes(js);
			int num_buttons = SDL_JoystickNumButtons(js);
			int num_hats = SDL_JoystickNumHats(js);
			int num_balls = SDL_JoystickNumBalls(js);
			std:: cout << guid_str <<  " \\ " << name << " \\ axes: " << num_axes << " buttons: " << num_buttons << " hats: " << num_hats << " balls: " << num_balls << std::endl;
		}

	//start webserver and bind to socket.
	handler handler_;
	http_server::options options(handler_);
	http_server server(
		options.address("0.0.0.0")
		.port("1111"));
	std::cout << "found joystick! starting server!" << std::endl;
	server.run();	//function BLOCKS! see handler struct at top of page!
	return 0;
}

/* 	you can test the output with the following terminal command "while true; do curl localhost:1111; done;" */

/* layout of mayflash V2 DDR pad
 * __________________________
 * |		|		|		|
 * |	6	|	2	|	7	|
 * |		|		|		|
 * |________|_______|_______|
 * |		|		|		|
 * |	0	|		|	3	|
 * |		|		|		|
 * |________|_______|_______|
 * |		|		|		|
 * |	4	|	1	|	5	|
 * |		|		|		|
 * |________|_______|_______|
 *
 *
 *
 * */
