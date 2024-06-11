import { readSync } from 'node:fs';
import { Buffer } from 'node:buffer';

const NEW_LINE = '\n'.charCodeAt(0);

/**
 * Do not use process.stdin.fd as it causes a strange bug on Unix systems when running on Nodejs
 * See https://github.com/Olian04/gleam-stdin/issues/3
 */
const stdinFileDescriptor = 0;

function* stdinGenerator() {
  let lineBuff = Buffer.allocUnsafe(1);
  while (true) {
    try {
      if (readSync(stdinFileDescriptor, lineBuff, 0, 1, null) === 0) {
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
    if (readSync(stdinFileDescriptor, readBuff, 0, 1, null) === 0) {
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
