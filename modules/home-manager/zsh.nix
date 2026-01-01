{
  pkgs,
  config,
  ...
}:

{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = false;
    syntaxHighlighting.enable = true;

    shellAliases = {
      la = "ls -a";
      ll = "ls -la";
      vi = "nvim";
      vim = "nvim";
      nix-test   = ''sudo nixos-rebuild test   --flake "/home/laooree/.dotfiles/"'';
      nix-switch = ''sudo nixos-rebuild switch --flake "/home/laooree/.dotfiles/"'';
      e = ''emacsclient --no-window --alternate-editor=""'';
      ed =''emacsclient --no-window --eval "(dired \"$(pwd)\")" --alternate-editor=""'';
      pip2nix = "nix run github:nix-community/pip2nix -- generate";
    };
    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];

    initContent = ''
      PROMPT="%F{#00d3d0}%n%f in %F{#feacd0}%1~%f%k  "

      zstyle ':completion:*' menu select # tab opens cmp menu
      # zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
      zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/

      setopt append_history inc_append_history share_history # better history on exit,
      setopt auto_menu menu_complete # autocmp first menu match
      setopt autocd # type a dir to cd
      setopt auto_param_slash # if dir is completed, add / instead of space
      setopt no_case_glob no_case_match # make cmp case insensitive
      setopt globdots # match .files too
      setopt extended_glob # match ~ # ^
      unsetopt prompt_sp # don't autoclean blanklines
      stty stop undef # disable accidental ctrl s
      bindkey -e # emacs keybindings

      # Function to compress pdf files:
      gs-pdf-compress() {
        if [[ $# -ne 2 ]]; then
          echo "Usage: gs-pdf-compress input.pdf output.pdf"
          return 1
        fi

        local input="$1"
        local output="$2"

        gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
           -dDownsampleColorImages=false \
           -dDownsampleGrayImages=false \
           -dDownsampleMonoImages=false \
           -dNOPAUSE -dBATCH \
           -sOutputFile="$output" "$input"
            }

      # Function to run emacs inside a nix-shell environment
      nix-emacs () {
        setsid nix-shell . --command "emacs" &> /dev/null
      }
    '';

  };

}
