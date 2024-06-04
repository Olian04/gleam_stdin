import gleam/dynamic
import gleam/iterator
import gleam/result

@external(erlang, "io", "get_line")
@external(javascript, "./js_ffi.mjs", "read_line")
fn ffi_read_line(prompt: String) -> dynamic.Dynamic

fn read_line() -> Result(String, Nil) {
  ffi_read_line("")
  |> dynamic.from()
  |> dynamic.string()
  |> result.nil_error()
}

fn assert_upwrap(res: Result(a, _)) -> a {
  let assert Ok(a) = res
  a
}

pub fn stdin() -> iterator.Iterator(String) {
  iterator.repeatedly(read_line)
  |> iterator.take_while(result.is_ok)
  |> iterator.map(assert_upwrap)
}

import gleam/io

pub fn main() {
  stdin()
  |> iterator.to_list
  |> io.debug
}
