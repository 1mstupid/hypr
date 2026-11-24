{
  description = "Mais um exemplo!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    wrappers.url = "github:lassulus/wrappers";
    quickshell.url = "github:1mstupid/quickshell";
    woomer.url = "github:coffeeispower/woomer";
  };

  outputs = {
    self,
    nixpkgs,
    wrappers,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    hypr = inputs.hyprland.packages.${system}.default;
    defaultRuntimePkgs = let
      input = {
        package,
        output ? "default",
      }:
        inputs.${package}.packages.${system}.${output};
    in {
      quickshell = input {package = "quickshell";};
      woomer = input {package = "woomer";};
    };

    mkWrapped = {
      pkgs,
      package,
      runtimePackages,
      exePath,
      flags,
      env,
    }:
      (wrappers.lib.wrapPackage {
        inherit env pkgs package exePath flags;
        runtimeInputs = builtins.attrValues runtimePackages;
      }).overrideAttrs (old: {
        passthru = (old.passthru or {}) // {inherit runtimePackages;};
      });
    repoSrc = pkgs.lib.cleanSourceWith {
      src = ./.;
      filter = path: type: let
        name = baseNameOf path;
      in
        !(name == ".git" || name == ".gitignore" || name == "result" || name == ".direnv");
    };
  in {
    lib.defaultRuntimePkgs.${system} = defaultRuntimePkgs;

    packages.${system} = {
      default = pkgs.lib.makeOverridable mkWrapped {
        inherit pkgs;
        package = hypr;
        runtimePackages = defaultRuntimePkgs;
        exePath = pkgs.lib.getExe hypr;
        env."MODULES_ROOT" = ./modules;
        env."HYPRLAND_ROOT" = ./.;
        env."QS_CONFIG" = "${inputs.quickshell.packages.${system}.quickshell-files}";
        flags."--config" = ./hyprland.lua;
      };
      repo-files = pkgs.stdenvNoCC.mkDerivation {
        pname = "hyprland-repo-files";
        version = "1.0";
        src = repoSrc;
        dontBuild = true;
        installPhase = ''
          mkdir -p $out
          cp -r . $out/
        '';
      };
    };
  };
}
