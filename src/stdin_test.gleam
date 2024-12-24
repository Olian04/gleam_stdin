import gleam/io
import gleam/yielder
import stdin.{stdin}

pub fn main() {
  stdin()
  |> yielder.to_list
  |> io.debug
}
