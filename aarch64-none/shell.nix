{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  RUSTC_VERSION = pkgs.lib.readFile ./rust-toolchain.toml;

  nativeBuildInputs = with pkgs; [
    rustup
    rustc
    cargo

    pkgsCross.aarch64-embedded.buildPackages.gcc
    pkgsCross.aarch64-embedded.buildPackages.binutils
  ];
}
