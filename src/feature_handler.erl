-module(feature_handler).
-behaviour(cowboy_http_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-record(state, {
}).

init(_, Req, _Opts) ->
  {ok, Req, #state{}}.

handle(Req, State=#state{}) ->
  R = pooler:take_member(redis1),
  {ok, Feature} = eredis:q(R, ["GET", "feature:load_testing"]),
  pooler:return_member(redis1, R, ok),
  {ok, Req2} = cowboy_req:reply(200, [{<<"content-type">>, <<"text/plain">>}], Feature, Req),
  {ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
  ok.
