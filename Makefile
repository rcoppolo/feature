PROJECT = feature
DEPS = cowboy eredis pooler
dep_eredis = git https://github.com/wooga/eredis
dep_pooler = git https://github.com/seth/pooler
include erlang.mk
