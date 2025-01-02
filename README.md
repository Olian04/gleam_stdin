[![Package Version](https://img.shields.io/hexpm/v/stdin)](https://hex.pm/packages/stdin)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/stdin/)

# stdin

`stdin` provides a synchronous iterator for consuming stdin. It supports all the non-browser targets, Erlang, Node, Deno, and Bun.

The goal of this package is to provide a uniform way of consuming stdin for all supported targets on all supported platforms.

| Platform     | Tested version | Date         |
|:------------:|:-------------:|:------------:|
| Windows 10   | 1.1.4         | `2025-01-02` |
| macOS 15.2   | 2.0.0         | `2025-01-02` |
| Ubuntu 24.04 | 2.0.0         | `2025-01-02` |
| Fedora 40    | 2.0.0         | `2025-01-02` |

```sh
gleam add stdin
```

```gleam
import gleam/io
import gleam/yielder
import stdin

pub fn main() {
  stdin.read_lines()
  |> yielder.to_list
  |> io.debug
}

```

Further documentation can be found at <https://hexdocs.pm/stdin>.

## Development

```sh
./run_test.sh
```
