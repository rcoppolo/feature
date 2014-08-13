-module(feature_handler).
-behaviour(cowboy_http_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

init(_, Req, _Opts) ->
  {ok, Redis} = eredis:start_link(),
  {ok, Req, Redis}.

handle(Req, Redis) ->
  {ok, Feature} = eredis:q(Redis, ["GET", "feature:load_testing"]),
  {ok, Req2} = cowboy_req:reply(200, [{<<"content-type">>, <<"text/plain">>}], Feature, Req),
  {ok, Req2, Redis}.

terminate(_Reason, _Req, _State) ->
  ok.
