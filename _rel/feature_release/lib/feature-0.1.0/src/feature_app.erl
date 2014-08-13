-module(feature_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
  Dispatch = cowboy_router:compile([
    {'_', [{"/feature", feature_handler, []}]}
  ]),
  cowboy:start_http(http_listener, 100, [{port, 8000}],
    [{env, [{dispatch, Dispatch}]}]
  ),
  feature_sup:start_link().

stop(_State) ->
  ok.
