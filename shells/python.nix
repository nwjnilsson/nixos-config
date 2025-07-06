{ pkgs, ... }:

pkgs.mkShell {
  buildInputs = with pkgs.python3Packages; [
    python
    python-lsp-server
    python-lsp-black
  ];
}
