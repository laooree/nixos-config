{ inputs, config, pkgs, ... }:

let

  hanoi = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner  = "laooree";
    repo   = "hanoi-tower";
    rev    = "main";
    sha256 = "sha256-TcNgz2SPgjua6t6ZL7HRyfxCGHr8o6+SFo+ehHRF5qU=";
  }) {};

in

{

  environment.systemPackages = [ hanoi ];

}
