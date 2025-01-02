#!/bin/bash

echo "JS Node" | gleam test --target=javascript --runtime=node
NODE=$?
echo "JS Bun" | gleam test --target=javascript --runtime=bun
BUN=$?
echo "JS Deno" | gleam test --target=javascript --runtime=deno
DENO=$?
echo "Erlang" | gleam test --target=erlang
ERLANG=$?

if [ "$NODE" == 0 ]; then
	echo "JS Node ✔"
fi
if [ "$NODE" != 0 ]; then
	echo "JS Node ✘"
fi

if [ "$BUN" == 0 ]; then
	echo "JS Bun ✔"
fi
if [ "$BUN" != 0 ]; then
	echo "JS Bun ✘"
fi

if [ "$DENO" == 0 ]; then
	echo "JS Deno ✔"
fi
if [ "$DENO" != 0 ]; then
	echo "JS Deno ✘"
fi

if [ "$ERLANG" == 0 ]; then
	echo "Erlang ✔"
fi
if [ "$ERLANG" != 0 ]; then
	echo "Erlang ✘"
fi
