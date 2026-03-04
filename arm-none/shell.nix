{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  RUSTC_VERSION = pkgs.lib.readFile ./rust-toolchain.toml;

  nativeBuildInputs = with pkgs; [
    rustup
    rustc
    cargo

    pkgsCross.arm-embedded.buildPackages.gcc
    pkgsCross.arm-embedded.buildPackages.binutils
  ];
}
