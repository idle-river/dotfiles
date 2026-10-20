{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    helmfile
    kubectl
    kubernetes-helm
    lima
    minikube
    podman
    podman-compose
    podman-desktop
    podman-tui
    qemu
    utm
  ];
}
