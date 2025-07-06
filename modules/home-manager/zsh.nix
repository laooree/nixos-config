{
  pkgs,
  config,
  ...
}:

{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      vi = "nvim";
      vim = "nvim";
      nix-test = "sudo nixos-rebuild test --flake .";
      gs = "git status";
      ga = "git add";
      e = ''emacsclient --no-window --alternate-editor=""'';
    };

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];

    initContent = ''
      PROMPT=$'\n'"%F{#7ebae4} %F{#${config.lib.stylix.colors.base0B}} %n in %~"$'\n'"%f%k  "

      zstyle ':completion:*' menu select # tab opens cmp menu
      zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
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
    '';

  };

}
