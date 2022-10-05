{nixpkgs}: let
  l = nixpkgs.lib // builtins;
  /*
  Use the Tasks Blocktype for targets that you want to
  make accessible with a 'run' action on the TUI.
  */
  tasks = name: {
    inherit name;
    type = "tasks";
    actions = {
      system,
      flake,
      fragment,
      fragmentRelPath,
    }: [
      {
        name = "run";
        description = "exec this task";
        command = ''
          nix run ${flake}#${fragment}
        '';
      }
    ];
  };
in
  tasks
