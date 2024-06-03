[![Package Version](https://img.shields.io/hexpm/v/stdin)](https://hex.pm/packages/stdin)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/stdin/)

# stdin

`stdin` provides a synchronous iterator for consuming stdin. It supports all the non-browser targets, Erlang, Node, Deno, and Bun.

```sh
gleam add stdin
```

```gleam
import gleam/io
import gleam/iterator
import stdin.{stdin}

pub fn main() {
  stdin()
  |> iterator.to_list
  |> io.debug
}
```

Further documentation can be found at <https://hexdocs.pm/stdin>.

## Development

```sh
gleam run   # Run the project
```
