{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    nil # nix lsp
    alejandra # formatting .nix
  ];
}
