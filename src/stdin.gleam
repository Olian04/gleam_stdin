import gleam/dynamic
import gleam/result
import gleam/yielder

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

pub fn stdin() -> yielder.Yielder(String) {
  yielder.repeatedly(read_line)
  |> yielder.take_while(result.is_ok)
  |> yielder.map(assert_upwrap)
}
