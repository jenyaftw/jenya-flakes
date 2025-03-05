{ lib, wivrn, fetchFromGitHub }:

wivrn.overrideAttrs (oldAttrs: {
  version = "jenya";

  src = fetchFromGitHub {
    owner = "wivrn";
    repo = "wivrn";
    rev = "265afba56a04ad549f503d5358df80002b435324";
    hash = "sha256-KpsS0XssSnE2Fj5rrXq1h+yNHhF7BzfPxwRUhZUZEaw=";
  };

  cudaSupport = true;
})
