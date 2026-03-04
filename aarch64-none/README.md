# aarch64-none

Toolchain boilerplate for `aarch64-none` (bare-metal).

Examples targets **Raspberry Pi 3B** (`BCM2837`).

---

# installation

### requirements

|                             |                                                     |
| --------------------------- | --------------------------------------------------- |
| `rust`                      | `nighlty` (`1.95.0-nightly (838709580 2026-02-17)`) |
| `cargo`                     | `nighlty` (`1.95.0-nightly (838709580 2026-02-17)`) |
| `aarch64-none-elf-gcc`      | `14.3.0`                                            |
| `binutils-aarch64-none-elf` |                                                     |
| `qemu-system-aarch64`       | `10.1.2`                                            |

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
file target/aarch64-unknown-none/release/aarch64-none
aarch64-none-elf-objdump -d -D target/aarch64-unknown-none/release/aarch64-none >> build/aarch64.s

# build kernel8.img
aarch64-none-elf-objcopy -O binary target/aarch64-unknown-none/release/aarch64-none build/kernel8.img

# qemu
qemu-system-aarch64 -M help | grep raspi
qemu-system-aarch64 -M raspi3b -kernel build/kernel8.img -serial null -serial stdio -display none
```

### qemu

`qemu-system-aarch64` have a limited set of available machine for Raspberry Pi's models.  
Run `qemu-system-aarch64 -M help | grep raspi` to see supported models.

---

# references
