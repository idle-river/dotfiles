{ inputs, pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
  fromInputs = names: map (name: inputs.${name}.packages.${system}.default) names;
in
{
  environment.systemPackages = fromInputs [
    "aegis"
    "clonee"
    "helium"
    "opal"
    "silicate"
    "sonara"
  ];
}
