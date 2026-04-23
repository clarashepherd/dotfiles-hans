{ config, pkgs, ... }:

{
  programs.bash = {
        enable = true;
        interactiveShellInit = ''
            if [ -f "$HOME/.secrets/github-token" ]; then
                export GITHUB_TOKEN="$(cat $HOME/.secrets/github-token)"
            fi
            if [ -d "$HOME/repos/beo-scripts" ]; then
                export PATH="$HOME/repos/beo-scripts:$PATH"
		if [ -f "$HOME/repos/beo-scripts/aliases.sh" ]; then
                    source "$HOME/repos/beo-scripts/aliases.sh"
                fi
            fi
            if [ -f /usr/share/git/completion/git-completion.bash ]; then
                source /usr/share/git/completion/git-completion.bash
            fi


        '';
        shellAliases = {
            grep = "grep --color=auto";
	    ls = "ls  -a --color=auto";
            ff = "fzf";
            lg = "lazygit";
            gg = "git grep --color";
        };
        promptInit = ''
          PS1="\[\e]2;\h:\u:\w\a\]\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ "
        '';
  };

  environment.systemPackages = with pkgs; [
    eza
  ];

  # pragmatic exception to nixos' store philosophy
  # otherwise we'll get bad interpretation issues..
  # seems like the "standard" fix
  system.activationScripts.binbash = {
    deps = [ "binsh" ];
    text = ''
      ln -sf ${pkgs.bash}/bin/bash /bin/bash
    '';
  };
}
