PROJECT = ejb_user
PROJECT_DESCRIPTION = New project
PROJECT_VERSION = 0.0.1

DEPS = hackney
dep_hackney = git https://github.com/benoitc/hackney master

include erlang.mk

console:
	erl -pa deps/*/ebin/ ebin/

