# toolchains-avr

Toolchain boilerplate for `avr`.

---

# installation

### requirements

|            |                                                     |
| ---------- | --------------------------------------------------- |
| `rust`     | `nighlty` (`1.95.0-nightly (838709580 2026-02-17)`) |
| `cargo`    | `nighlty` (`1.95.0-nightly (838709580 2026-02-17)`) |
| `gcc-avr`  | `14.3.0`                                            |
| `avrdude`  | `8.1`                                               |
| `ravedude` | `0.2.2`                                             |

### setup

#### nix

Build dependencies and environment are setup in `shell.nix`.

```sh
nix-shell
```

---

# usage

Note that in most cases, `root` permission is required to access `/dev/ttyXXX`.

```sh
# run with serial output with `ravedude`
cargo run

# build .elf in target/avr-none/arduino.elf
cargo build --release

# push to board
sudo avrdude -p atmega328p -c arduino -P /dev/ttyACM0 -b 115200 -D -U flash:w:target/avr-none/release/avr.elf
```

---

# targets

### rust

`target` may be different based on the `nightly` version used (e.g `avr-none`, `avr-unknown-unknown`, via `json`, etc).
The current setup uses `latest` branch (`1.95`).

See `.cargo/config.toml`.

### other boards

Below files must be updated to the correct target:

```toml
# `.cargo/config.toml`
[build]
...
rustflags = ["-C", "target-cpu=$TARGET"] # replace $TARGET

# `Raveduded.toml`
[general]
...
board = "$BOARD" # replace $BOARD
```

---

# references
