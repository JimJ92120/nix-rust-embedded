# embedded-toolchains-arm-none

Toolchain boilerplate for `arm-none` (bare-metal).

Examples targets **Raspberry Pi 2B v1.1** (`BCM2836`).

---

# installation

### requirements

|                          |                                                     |
| ------------------------ | --------------------------------------------------- |
| `rust`                   | `nighlty` (`1.95.0-nightly (838709580 2026-02-17)`) |
| `cargo`                  | `nighlty` (`1.95.0-nightly (838709580 2026-02-17)`) |
| `arm-none-eabi-gcc`      | `14.3.0`                                            |
| `binutils-arm-none-eabi` |                                                     |
| `qemu-system-arm`        | `10.1.2`                                            |

### nix

Build dependencies and environment are setup in `shell.nix`.

```sh
nix-shell
```

Note that after running `nix-collect-garbage -d`, project may still refer to old (non-existing) `/nix-store` paths for `binutils`.  
Delete `~/.rustup` and `~/.cargo` directory if so, then exit and re-enter `nix-shell`.

---

# usage

```sh
# build rust
cargo build --release

# inspect build
file target/armv7a-none-eabi/release/arm-none
arm-none-eabi-objdump -d -D target/armv7a-none-eabi/release/arm-none >> build/armv7a.s

# build kernel7.img
arm-none-eabi-objcopy -O binary target/armv7a-none-eabi/release/arm-none build/kernel7.img

# qemu
qemu-system-arm -M raspi2b -kernel build/kernel7.img -serial null -serial stdio -display none
```

### qemu

`qemu-system-arm` have a limited set of available machine for Raspberry Pi's models.  
Run `qemu-system-arm -M help | grep raspi` to see supported models.

---

# references
