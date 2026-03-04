#![no_std]
#![no_main]
#![allow(dead_code)]
#![allow(unused_imports)]

#[cfg(target_arch = "avr")]

mod panic;

#[unsafe(no_mangle)]
pub extern "C" fn main() {
    loop {}
}
