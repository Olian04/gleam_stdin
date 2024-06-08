import { readSync } from 'node:fs';
import { Buffer } from 'node:buffer';

const NEW_LINE = '\n'.charCodeAt(0);

function* stdinGenerator() {
  const stdinFileDescriptor = (() => {
    if (globalThis.Deno) {
      return globalThis.Deno.stdin.rid;
    } else {
      process.stdin.resume();
      return process.stdin.fd;
    }
  })();

  let lineBuff = Buffer.allocUnsafe(1);
  while (true) {
    try {
      if (readSync(stdinFileDescriptor, lineBuff, 0, 1) === 0) {
        // Read EOF from stdin
        return;
      } else {
        // Read byte from stdin
        break;
      }
    } catch (err) {
      if (err.code === 'EAGAIN') {
        continue;
      }
      throw err;
    }
  }

  while (true) {
    const readBuff = Buffer.allocUnsafe(1);
    if (readSync(stdinFileDescriptor, readBuff, 0, 1) === 0) {
      // EOF
      break;
    }
    lineBuff = Buffer.concat([lineBuff, readBuff]);
    if (readBuff[0] === NEW_LINE) {
      yield lineBuff.toString();
      lineBuff = Buffer.allocUnsafe(0);
    }
  }

  if (lineBuff.length > 0) {
    yield lineBuff.toString();
  }
}

const stdin = stdinGenerator();

export function read_line(_) {
  const next = stdin.next();
  if (next.done) {
    return null;
  }
  return next.value;
}
