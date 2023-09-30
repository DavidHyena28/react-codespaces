{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.reuse

    # To be able to use vim in the terminal
    pkgs.vim
  
    # utility for search
    pkgs.ack

    # docker utility
    pkgs.dive

    # wget and curl
    pkgs.wget
    pkgs.curl

    # For frontend
    pkgs.yarn
    pkgs.nodejs_20
    pkgs.nodePackages.graphqurl
  ];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

  enterShell = ''
    hello
    git --version
    export COMPOSE_PROJECT_NAME=react-codespaces_devcontainer
  '';

  # https://devenv.sh/languages/
  languages.rust = {
    enable = true;
    # https://devenv.sh/reference/options/#languagesrustversion
    version = "latest";
    packages.rust-src = pkgs.rustPlatform.rustLibSrc;
  };

  # https://devenv.sh/pre-commit-hooks/
  pre-commit.hooks = {
    clippy.enable = false;
    rustfmt.enable = false;
    reuse = {
      enable = false;
      name = "Reuse license headers";
      entry = "${pkgs.reuse}/bin/reuse lint";
      pass_filenames = false;
    };
  };

  # https://devenv.sh/integrations/dotenv/
  # Enable usage of the .env file for setting env variables
  # dotenv.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
