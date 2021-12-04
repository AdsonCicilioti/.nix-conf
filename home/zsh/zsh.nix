{ config, pkgs, lib, ... }:
{
  programs = {
    zsh = {
      enable = true;
      autocd = true;
      # defaultKeymap = "viins";
      enableCompletion = true;
      enableAutosuggestions = true;
      history = {
        ignoreDups = true;
        ignoreSpace = true;
        expireDuplicatesFirst = true;
        share = true;
      };
      sessionVariables = {
        # Reduce time to wait for multi-key sequences
        KEYTIMEOUT = 1;
        # Set right prompt to show time
        # RPROMPT = "%F{8}%*";
        # zsh-users config
        ZSH_AUTOSUGGEST_USE_ASYNC = 1;
        ZSH_HIGHLIGHT_HIGHLIGHTERS = [ "main" "brackets" "cursor" ];
      };
      shellAliases = {
        "reload!" = "source $HOME/.zshrc";
        ll = "ls -l";
        la = "ls -lha";
        "rbuild!" = "sudo nixos-rebuild switch --cores 8 -j 8";
        rbuild = "sudo nixos-rebuild boot --cores 8 -j 8";
        hmbuild = "home-manager switch --cores 8";
        srch = "nix search";
        "srch!" = "nix search -u";
        clr = "clear";
      };
      initExtraFirst = ''
        zstyle ':zim:input' double-dot-expand yes

        SPACESHIP_PROMPT_ORDER=(
          char # Prompt character
          # user      # Username section
          dir       # Current directory section
          host      # Hostname section
          git       # Git section (git_branch + git_status)
          hg        # Mercurial section (hg_branch  + hg_status)
          exec_time # Execution time
          # line_sep      # Line break
          vi_mode   # Vi-mode indicator
          jobs      # Background jobs indicator
          exit_code # Exit code section
          time      # Time stamps section
        )
        SPACESHIP_DIR_PREFIX=""
        SPACESHIP_USER_PREFIX=""
        SPACESHIP_USER_SHOW=false
        SPACESHIP_PROMPT_ADD_NEWLINE=false
        SPACESHIP_CHAR_SYMBOL=" ❱❱"
        SPACESHIP_CHAR_SUFFIX=" "

        # HISTORY search
        setopt HIST_IGNORE_ALL_DUPS

      '';
      initExtra = ''
        bindkey '^[[A' history-substring-search-up
        bindkey '^[[B' history-substring-search-down
        bindkey "$terminfo[kcuu1]" history-substring-search-up
        bindkey "$terminfo[kcud1]" history-substring-search-down
        bindkey '^P' history-substring-search-up
        bindkey '^N' history-substring-search-down
        bindkey -M vicmd 'k' history-substring-search-up
        bindkey -M vicmd 'j' history-substring-search-down
      '';
      localVariables = { };

      plugins = [

        {
          src = pkgs.fetchFromGitHub {
            owner = "zimfw";
            repo = "input";
            rev = "master";
            sha256 = "sha256-4BtU7d2hJi2L7r+6wdmDddPi5459yEZyZiZJeKAfFfw=";
          };
          name = "zimfw-input";
          file = "init.zsh";
        }
        {
          src = pkgs.fetchFromGitHub {
            owner = "zimfw";
            repo = "completion";
            rev = "master";
            sha256 = "sha256-LNVKj/85zkYPjpfDDhlxErwFmjVY/vwr07GBQJGUU+0=";
          };
          name = "zimfw-completion";
          file = "init.zsh";
        }
        {
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "0.7.1";
            sha256 = "sha256-gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8=";
          };
          name = "zsh-syntax-highlighting";
          file = "zsh-syntax-highlighting.plugin.zsh";
        }
        {
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-history-substring-search";
            rev = "v1.0.2";
            sha256 = "sha256-Ptxik1r6anlP7QTqsN1S2Tli5lyRibkgGlVlwWZRG3k=";
          };
          name = "zsh-history-substring-search";
          file = "zsh-history-substring-search.plugin.zsh";
        }
        {
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.7.0";
            sha256 = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
          };
          name = "zsh-autosuggestions";
          file = "zsh-autosuggestions.plugin.zsh";
        }
        {
          src = pkgs.fetchFromGitHub {
            owner = "spaceship-prompt";
            repo = "spaceship-prompt";
            rev = "v3.16.1";
            sha256 = "sha256-sXnL57g5e7KboLXHzXxSD0+8aKPNnTX6Q2yVft+Pr7w=";
          };
          name = "spaceship-prompt";
          file = "spaceship.zsh";
        }
      ];
    };
  };
}
