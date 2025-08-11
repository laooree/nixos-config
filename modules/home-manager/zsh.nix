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
      nix-test = "sudo nixos-rebuild test --flake .";
      e = ''emacsclient --no-window --alternate-editor=""'';
    };
    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];

    initContent = ''
      PROMPT="%F{#335533}%n in %~"$'\n'"%f%k "

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

      # Flag to avoid printing newline before first prompt
      FIRST_PROMPT=1

      function newline_before_prompt() {
        if [[ $FIRST_PROMPT -eq 1 ]]; then
          FIRST_PROMPT=0
        else
          local last_cmd=$(fc -ln -1)
          if [[ "$last_cmd" != "clear" ]]; then
          echo
          fi
        fi
      }

      # Register the hook
      autoload -Uz add-zsh-hook
      add-zsh-hook precmd newline_before_prompt


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
    '';

  };

}
