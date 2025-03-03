{ lib, fetchFromGitLab, opencomposite }:

opencomposite.overrideAttrs (oldAttrs: {
  src = fetchFromGitLab {
    owner = "znixian";
    repo = "OpenOVR";
    fetchSubmodules = true;
    rev = "578a1a5c57204e7db31299351c8e312ead9ba7c4";
    hash = "sha256-LTC/RJdi4saj5hVli23GUm+ytKPv/Z94WHlo5s+tMeY=";
  };
})
