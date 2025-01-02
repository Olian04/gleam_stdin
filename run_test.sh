#!/bin/bash

if ! command -v gleam &> /dev/null; then
	echo "Gleam not found"
	exit 1
fi

# ---------------NODE--------------------

if ! command -v node &> /dev/null; then
	echo "JS Node ✘ (not found)"
	NODE=66
else
	cat ./README.md	| gleam test --target=javascript --runtime=node
	NODE=$?
fi


# ----------------BUN-------------------

if ! command -v bun &> /dev/null; then
	echo "JS Bun ✘ (not found)"
	BUN=66
else
	cat ./README.md | gleam test --target=javascript --runtime=bun
	BUN=$?
fi

# ----------------DENO-------------------

if ! command -v deno &> /dev/null; then
	echo "JS Deno ✘ (not found)"
	DENO=66
else
	cat ./README.md | gleam test --target=javascript --runtime=deno
	DENO=$?
fi

# ----------------ERLANG-----------------

if ! command -v erl &> /dev/null; then
	echo "Erlang BEAM ✘ (not found)"
	ERLANG=66
else
	cat ./README.md | gleam test --target=erlang
	ERLANG=$?
fi

# ----------------RESULTS----------------
echo ''

if [ "$NODE" == 0 ]; then
	echo "JS Node ✔"
else
	echo "JS Node ✘ (test failed)"
fi

if [ "$BUN" == 0 ]; then
	echo "JS Bun ✔"
else
	echo "JS Bun ✘ (test failed)"
fi

if [ "$DENO" == 0 ]; then
	echo "JS Deno ✔"
else
	echo "JS Deno ✘ (test failed)"
fi

if [ "$ERLANG" == 0 ]; then
	echo "Erlang BEAM ✔"
else
	echo "Erlang BEAM ✘ (test failed)"
fi
