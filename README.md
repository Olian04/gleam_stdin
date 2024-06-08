[![Package Version](https://img.shields.io/hexpm/v/stdin)](https://hex.pm/packages/stdin)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/stdin/)

# stdin

`stdin` provides a synchronous iterator for consuming stdin. It supports all the non-browser targets, Erlang, Node, Deno, and Bun.

The goal of this package is to provide a uniform way of consuming stdin for all supported targets, in all supported runtimes, and on all supported platforms.

| Platform | Target     | Runtime | Status          |
|:--------:|:----------:|:-------:|:---------------:|
| Win      | Erlang     | Beam    | OK `2024-06-08` |
| Win      | Javascript | Node    | OK `2024-06-08` |
| Win      | Javascript | Deno    | OK `2024-06-08` |
| Win      | Javascript | Bun     | OK `2024-06-08` |
| Mac      | Erlang     | Beam    | OK `2024-06-03` |
| Mac      | Javascript | Node    | OK `2024-06-03` |
| Mac      | Javascript | Deno    | TBD             |
| Mac      | Javascript | Bun     | TBD             |
| Linux    | Erlang     | Beam    | TBD             |
| Linux    | Javascript | Node    | TBD             |
| Linux    | Javascript | Deno    | TBD             |
| Linux    | Javascript | Bun     | TBD             |

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
cat README.md | gleam test --target=javascript --runtime=node
cat README.md | gleam test --target=javascript --runtime=bun
cat README.md | gleam test --target=javascript --runtime=deno
cat README.md | gleam test --target=erlang
```
