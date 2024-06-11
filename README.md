[![Package Version](https://img.shields.io/hexpm/v/stdin)](https://hex.pm/packages/stdin)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/stdin/)

# stdin

`stdin` provides a synchronous iterator for consuming stdin. It supports all the non-browser targets, Erlang, Node, Deno, and Bun.

The goal of this package is to provide a uniform way of consuming stdin for all supported targets on all supported platforms.

| Platform     | Target Status | Date         |
|:------------:|:-------------:|:------------:|
| Windows 10   | All OK.       | `2024-06-08` |
| macOS 14.5   | All OK.       | `2024-06-11` |
| Ubuntu 24.04 | All OK.       | `2024-06-11` |
| Fedora 40    | All OK? #3    | `2024-06-11` |

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
