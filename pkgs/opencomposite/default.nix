{ lib, fetchFromGitLab, opencomposite }:

opencomposite.overrideAttrs (oldAttrs: {
  src = fetchFromGitLab {
    owner = "znixian";
    repo = "OpenOVR";
    fetchSubmodules = true;
    rev = "578a1a5c57204e7db31299351c8e312ead9ba7c4";
    hash = lib.fakeHash;
  };
})
