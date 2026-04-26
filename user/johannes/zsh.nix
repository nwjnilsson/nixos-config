{
  config,
  pkgs,
  ...
}: {
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.johannes = {pkgs, ...}: {
    home.stateVersion = "25.05";
    programs = {
      nix-index.enable = true;
      pay-respects = {
        enable = true;
        enableZshIntegration = true;
      };
      fzf.enable = true;
      zsh = {
        enable = true;
        oh-my-zsh = {
          enable = true;
          plugins = ["git" "z" "fzf"];
          theme = "robbyrussell";
        };
        initContent = ''
          eval "$(direnv hook zsh)"
          clang-format-all() {
            if ! command -v clang-format >/dev/null 2>&1; then
              echo "clang-format-all: clang-format not found in PATH" >&2
              echo "Hint: install clang-format (e.g. via nix-shell, direnv, or system packages)" >&2
              return 127
            fi

            local check=false
            local dir="src"

            while [[ $# -gt 0 ]]; do
              case "$1" in
                --check|--dry)
                  check=true
                  shift
                  ;;
                -h|--help)
                  cat <<EOF
          Usage: clang-format-all [--check|--dry] [DIR]

          Formats C++ files (.cpp, .h, .hpp) recursively.

          Options:
            --check, --dry   Check formatting without modifying files
            -h, --help       Show this help message

          Arguments:
            DIR              Directory to format (default: ./src)
          EOF
                  return 0
                  ;;
                *)
                  dir="$1"
                  shift
                  ;;
              esac
            done

            if [[ ! -d "$dir" ]]; then
              echo "Error: directory '$dir' does not exist" >&2
              return 1
            fi

            echo "$([[ $check == true ]] && echo "Checking" || echo "Formatting") C++ files in $dir…"

            find "$dir" \
              -type f \
              \( -name '*.cpp' -o -name '*.h' -o -name '*.hpp' \) \
              -exec clang-format $([[ $check == true ]] && echo "--dry-run --Werror" || echo "-i") {} +
          }
        '';
      };
    };
  };
}
