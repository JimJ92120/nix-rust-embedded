#![no_std]
#![no_main]

#[cfg(target_arch = "aarch64")]

mod panic;
mod boot;

#[unsafe(no_mangle)]
pub extern "C" fn main() -> ! {
    loop {}
}
